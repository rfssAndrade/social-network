#ifndef SOCIAL_NETWORK_MICROSERVICES_SRC_HOMETIMELINESERVICE_HOMETIMELINEHANDLER_H_
#define SOCIAL_NETWORK_MICROSERVICES_SRC_HOMETIMELINESERVICE_HOMETIMELINEHANDLER_H_

#include <sw/redis++/redis++.h>

#include <future>
#include <iostream>
#include <string>

#include "../../gen-cpp/HomeTimelineService.h"
#include "../../gen-cpp/PostStorageService.h"
#include "../../gen-cpp/SocialGraphService.h"
#include "../ClientPool.h"
#include "../ThriftClient.h"
#include "../logger.h"
#include "../tracing.h"

#include "opentelemetry/trace/context.h"
#include "opentelemetry/trace/provider.h"
#include "opentelemetry/trace/span_startoptions.h"

using namespace sw::redis;
namespace social_network {

  namespace context = opentelemetry::context;
  using namespace opentelemetry::trace;
class HomeTimelineHandler : public HomeTimelineServiceIf {
 public:
  HomeTimelineHandler(Redis *,
                      ClientPool<ThriftClient<PostStorageServiceClient>> *,
                      ClientPool<ThriftClient<SocialGraphServiceClient>> *);
  HomeTimelineHandler(RedisCluster *,
                      ClientPool<ThriftClient<PostStorageServiceClient>> *,
                      ClientPool<ThriftClient<SocialGraphServiceClient>> *);
  ~HomeTimelineHandler() override = default;

  void ReadHomeTimeline(std::vector<Post> &, int64_t, int64_t, int, int,
                        const std::map<std::string, std::string> &) override;

  void WriteHomeTimeline(int64_t, int64_t, int64_t, int64_t,
                         const std::vector<int64_t> &,
                         const std::map<std::string, std::string> &) override;

 private:
  Redis *_redis_client_pool;
  RedisCluster *_redis_cluster_client_pool;
  ClientPool<ThriftClient<PostStorageServiceClient>> *_post_client_pool;
  ClientPool<ThriftClient<SocialGraphServiceClient>> *_social_graph_client_pool;
};

HomeTimelineHandler::HomeTimelineHandler(
    Redis *redis_pool,
    ClientPool<ThriftClient<PostStorageServiceClient>> *post_client_pool,
    ClientPool<ThriftClient<SocialGraphServiceClient>>
        *social_graph_client_pool) {
  _redis_client_pool = redis_pool;
  _redis_cluster_client_pool = nullptr;
  _post_client_pool = post_client_pool;
  _social_graph_client_pool = social_graph_client_pool;
}

HomeTimelineHandler::HomeTimelineHandler(
    RedisCluster *redis_pool,
    ClientPool<ThriftClient<PostStorageServiceClient>> *post_client_pool,
    ClientPool<ThriftClient<SocialGraphServiceClient>>
        *social_graph_client_pool) {
  _redis_client_pool = nullptr;
  _redis_cluster_client_pool = redis_pool;
  _post_client_pool = post_client_pool;
  _social_graph_client_pool = social_graph_client_pool;
}

void HomeTimelineHandler::WriteHomeTimeline(
    int64_t req_id, int64_t post_id, int64_t user_id, int64_t timestamp,
    const std::vector<int64_t> &user_mentions_id,
    const std::map<std::string, std::string> &carrier) {
  
  StartSpanOptions options;
  options.kind          = SpanKind::kServer;

  std::map<std::string, std::string> &request_headers =
        const_cast<std::map<std::string, std::string> &>(carrier);
  const HttpTextMapCarrier<std::map<std::string, std::string>> carrier_map(request_headers);
  auto prop        = context::propagation::GlobalTextMapPropagator::GetGlobalPropagator();
  auto current_ctx = context::RuntimeContext::GetCurrent();
  auto new_context = prop->Extract(carrier_map, current_ctx);
  options.parent   = GetSpan(new_context)->GetContext();

  auto span_OTEL = get_tracer("home_timeline_tracer")->StartSpan("WriteHomeTimeline", options);
  auto scope = get_tracer("home_timeline_tracer")->WithActiveSpan(span_OTEL);
  
  // // Initialize a span
  // TextMapReader reader(carrier);
  // auto parent_span = opentracing::Tracer::Global()->Extract(reader);
  // auto span = opentracing::Tracer::Global()->StartSpan(
  //     "write_home_timeline_server", {opentracing::ChildOf(parent_span->get())});

  StartSpanOptions followers_options;
  followers_options.kind = SpanKind::kClient;  // client
  
  auto followers_span = get_tracer("home_timeline_tracer")->StartSpan("Get-Followers-Client", followers_options);
  auto followers_scope = get_tracer("home_timeline_tracer")->WithActiveSpan(followers_span);
  auto followers_ctx = context::RuntimeContext::GetCurrent();
  HttpTextMapCarrier<std::map<std::string, std::string>> followers_carrier;
  auto followers_prop = context::propagation::GlobalTextMapPropagator::GetGlobalPropagator();
  followers_prop->Inject(followers_carrier, followers_ctx);

  // // Find followers of the user
  // auto followers_span = opentracing::Tracer::Global()->StartSpan(
  //     "get_followers_client", {opentracing::ChildOf(&span->context())});
  // std::map<std::string, std::string> writer_text_map;
  // TextMapWriter writer(writer_text_map);
  // opentracing::Tracer::Global()->Inject(followers_span->context(), writer);

  auto social_graph_client_wrapper = _social_graph_client_pool->Pop();
  if (!social_graph_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to social-graph-service";
    throw se;
  }
  auto social_graph_client = social_graph_client_wrapper->GetClient();
  std::vector<int64_t> followers_id;
  try {
    social_graph_client->GetFollowers(followers_id, req_id, user_id,
                                      followers_carrier.headers_);
  } catch (...) {
    LOG(error) << "Failed to get followers from social-network-service";
    _social_graph_client_pool->Remove(social_graph_client_wrapper);
    throw;
  }
  _social_graph_client_pool->Keepalive(social_graph_client_wrapper);
  // followers_span->Finish();
  followers_span->End();

  std::set<int64_t> followers_id_set(followers_id.begin(), followers_id.end());
  followers_id_set.insert(user_mentions_id.begin(), user_mentions_id.end());

  // Update Redis ZSet
  // Zset key: follower_id, Zset value: post_id_str, Zset score: timestamp_str

  // auto redis_span = opentracing::Tracer::Global()->StartSpan(
  //     "write_home_timeline_redis_update_client",
  //     {opentracing::ChildOf(&span->context())});
  std::string post_id_str = std::to_string(post_id);

  StartSpanOptions redis_options;
  redis_options.kind = SpanKind::kClient;  // client
  
  auto redis_span = get_tracer("home_timeline_tracer")->StartSpan("Redis-Update-Client", redis_options);
  auto redis_scope = get_tracer("home_timeline_tracer")->WithActiveSpan(redis_span);
  auto redis_ctx = context::RuntimeContext::GetCurrent();
  HttpTextMapCarrier<std::map<std::string, std::string>> redis_carrier;
  auto redis_prop = context::propagation::GlobalTextMapPropagator::GetGlobalPropagator();
  redis_prop->Inject(redis_carrier, redis_ctx);

  {
    if (_redis_client_pool) {
      auto pipe = _redis_client_pool->pipeline(false);
      for (auto &follower_id : followers_id_set) {
        pipe.zadd(std::to_string(follower_id), post_id_str, timestamp,
                  UpdateType::NOT_EXIST);
      }
      try {
        auto replies = pipe.exec();
      } catch (const Error &err) {
        LOG(error) << err.what();
        throw err;
      }
    } else {
      // Create multi-pipeline that match with shards pool
      std::map<std::shared_ptr<ConnectionPool>, std::shared_ptr<Pipeline>> pipe_map;
      auto *shards_pool = _redis_cluster_client_pool->get_shards_pool();

      for (auto &follower_id : followers_id_set) {
        auto conn = shards_pool->fetch(std::to_string(follower_id));
        auto pipe = pipe_map.find(conn);
        if(pipe == pipe_map.end()) {//Not found, create new pipeline and insert
          auto new_pipe = std::make_shared<Pipeline>(_redis_cluster_client_pool->pipeline(std::to_string(follower_id), false));
          pipe_map.insert(make_pair(conn, new_pipe));
          auto *_pipe = new_pipe.get();
          _pipe->zadd(std::to_string(follower_id), post_id_str, timestamp,
                  UpdateType::NOT_EXIST);
        }else{//Found, use exist pipeline
          std::pair<std::shared_ptr<ConnectionPool>, std::shared_ptr<Pipeline>> found = *pipe;
          auto *_pipe = found.second.get();
          _pipe->zadd(std::to_string(follower_id), post_id_str, timestamp,
                  UpdateType::NOT_EXIST);
        }
      }
      // LOG(info) <<"followers_id_set items:" << followers_id_set.size()<<"; pipeline items:" << pipe_map.size();
      try {
        for(auto const &it : pipe_map) {
          auto _pipe = it.second.get();
          _pipe->exec();
        }

      } catch (const Error &err) {
        LOG(error) << err.what();
        redis_span->End();
        span_OTEL->End();
        throw err;
      }
    }
  }
  // redis_span->Finish();
  redis_span->End();
  span_OTEL->End();
}

void HomeTimelineHandler::ReadHomeTimeline(
    std::vector<Post> &_return, int64_t req_id, int64_t user_id, int start_idx,
    int stop_idx, const std::map<std::string, std::string> &carrier) {

  StartSpanOptions options;
  options.kind          = SpanKind::kServer;

  std::map<std::string, std::string> &request_headers =
        const_cast<std::map<std::string, std::string> &>(carrier);
  const HttpTextMapCarrier<std::map<std::string, std::string>> carrier_map(request_headers);
  auto prop        = context::propagation::GlobalTextMapPropagator::GetGlobalPropagator();
  auto current_ctx = context::RuntimeContext::GetCurrent();
  auto new_context = prop->Extract(carrier_map, current_ctx);
  options.parent   = GetSpan(new_context)->GetContext();

  auto span_OTEL = get_tracer("home_timeline_tracer")->StartSpan("ReadHomeTimeline", options);
  auto scope = get_tracer("home_timeline_tracer")->WithActiveSpan(span_OTEL);
  
  // // Initialize a span
  // TextMapReader reader(carrier);
  // std::map<std::string, std::string> writer_text_map;
  // TextMapWriter writer(writer_text_map);
  // auto parent_span = opentracing::Tracer::Global()->Extract(reader);
  // auto span = opentracing::Tracer::Global()->StartSpan(
  //     "read_home_timeline_server", {opentracing::ChildOf(parent_span->get())});
  // opentracing::Tracer::Global()->Inject(span->context(), writer);

  if (stop_idx <= start_idx || start_idx < 0) {
    span_OTEL->End();
    return;
  }

  // auto redis_span = opentracing::Tracer::Global()->StartSpan(
  //     "read_home_timeline_redis_find_client",
  //     {opentracing::ChildOf(&span->context())});

  StartSpanOptions redis_options;
  redis_options.kind = SpanKind::kClient;  // client
  
  auto redis_span = get_tracer("home_timeline_tracer")->StartSpan("Redis-Find-Client", redis_options);
  auto redis_scope = get_tracer("home_timeline_tracer")->WithActiveSpan(redis_span);
  auto redis_ctx = context::RuntimeContext::GetCurrent();
  HttpTextMapCarrier<std::map<std::string, std::string>> redis_carrier;
  auto redis_prop = context::propagation::GlobalTextMapPropagator::GetGlobalPropagator();
  redis_prop->Inject(redis_carrier, redis_ctx);

  std::vector<std::string> post_ids_str;
  try {
    if (_redis_client_pool) {
      _redis_client_pool->zrevrange(std::to_string(user_id), start_idx,
                                    stop_idx - 1,
                                    std::back_inserter(post_ids_str));
    } else {
      _redis_cluster_client_pool->zrevrange(std::to_string(user_id), start_idx,
                                            stop_idx - 1,
                                            std::back_inserter(post_ids_str));
    }
  } catch (const Error &err) {
    LOG(error) << err.what();
    throw err;
  }
  // redis_span->Finish();
  redis_span->End();

  StartSpanOptions posts_options;
  posts_options.kind = SpanKind::kClient;  // client
  
  auto posts_span = get_tracer("home_timeline_tracer")->StartSpan("Read-Posts-Client", posts_options);
  auto posts_scope = get_tracer("home_timeline_tracer")->WithActiveSpan(posts_span);
  auto posts_ctx = context::RuntimeContext::GetCurrent();
  HttpTextMapCarrier<std::map<std::string, std::string>> posts_carrier;
  auto posts_prop = context::propagation::GlobalTextMapPropagator::GetGlobalPropagator();
  posts_prop->Inject(posts_carrier, posts_ctx);

  std::vector<int64_t> post_ids;
  for (auto &post_id_str : post_ids_str) {
    post_ids.emplace_back(std::stoul(post_id_str));
  }

  auto post_client_wrapper = _post_client_pool->Pop();
  if (!post_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to post-storage-service";
    throw se;
  }
  auto post_client = post_client_wrapper->GetClient();
  try {
    post_client->ReadPosts(_return, req_id, post_ids, posts_carrier.headers_);
  } catch (...) {
    _post_client_pool->Remove(post_client_wrapper);
    LOG(error) << "Failed to read posts from post-storage-service";
    throw;
  }
  _post_client_pool->Keepalive(post_client_wrapper);
  // span->Finish();
  span_OTEL->End();
}

}  // namespace social_network

#endif  // SOCIAL_NETWORK_MICROSERVICES_SRC_HOMETIMELINESERVICE_HOMETIMELINEHANDLER_H_
