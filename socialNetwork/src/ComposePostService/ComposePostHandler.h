#ifndef SOCIAL_NETWORK_MICROSERVICES_SRC_COMPOSEPOSTSERVICE_COMPOSEPOSTHANDLER_H_
#define SOCIAL_NETWORK_MICROSERVICES_SRC_COMPOSEPOSTSERVICE_COMPOSEPOSTHANDLER_H_

#include <chrono>
#include <future>
#include <iostream>
#include <nlohmann/json.hpp>
#include <string>
#include <vector>

#include "../../gen-cpp/ComposePostService.h"
#include "../../gen-cpp/HomeTimelineService.h"
#include "../../gen-cpp/MediaService.h"
#include "../../gen-cpp/PostStorageService.h"
#include "../../gen-cpp/TextService.h"
#include "../../gen-cpp/UniqueIdService.h"
#include "../../gen-cpp/UserService.h"
#include "../../gen-cpp/UserTimelineService.h"
#include "../../gen-cpp/social_network_types.h"
#include "../ClientPool.h"
#include "../ThriftClient.h"
#include "../logger.h"
#include "../tracing.h"

#include "opentelemetry/trace/context.h"
#include "opentelemetry/trace/provider.h"

namespace social_network {

namespace context = opentelemetry::context;
using namespace opentelemetry::trace;

using json = nlohmann::json;
using std::chrono::duration_cast;
using std::chrono::milliseconds;
using std::chrono::system_clock;

class ComposePostHandler : public ComposePostServiceIf {
 public:
  ComposePostHandler(ClientPool<ThriftClient<PostStorageServiceClient>> *,
                     ClientPool<ThriftClient<UserTimelineServiceClient>> *,
                     ClientPool<ThriftClient<UserServiceClient>> *,
                     ClientPool<ThriftClient<UniqueIdServiceClient>> *,
                     ClientPool<ThriftClient<MediaServiceClient>> *,
                     ClientPool<ThriftClient<TextServiceClient>> *,
                     ClientPool<ThriftClient<HomeTimelineServiceClient>> *);
  ~ComposePostHandler() override = default;

  void ComposePost(int64_t req_id, const std::string &username, int64_t user_id,
                   const std::string &text,
                   const std::vector<int64_t> &media_ids,
                   const std::vector<std::string> &media_types,
                   PostType::type post_type,
                   const std::map<std::string, std::string> &carrier) override;

 private:
  ClientPool<ThriftClient<PostStorageServiceClient>> *_post_storage_client_pool;
  ClientPool<ThriftClient<UserTimelineServiceClient>>
      *_user_timeline_client_pool;

  ClientPool<ThriftClient<UserServiceClient>> *_user_service_client_pool;
  ClientPool<ThriftClient<UniqueIdServiceClient>>
      *_unique_id_service_client_pool;
  ClientPool<ThriftClient<MediaServiceClient>> *_media_service_client_pool;
  ClientPool<ThriftClient<TextServiceClient>> *_text_service_client_pool;
  ClientPool<ThriftClient<HomeTimelineServiceClient>>
      *_home_timeline_client_pool;

  void _UploadUserTimelineHelper(
      int64_t req_id, int64_t post_id, int64_t user_id, int64_t timestamp,
      const std::map<std::string, std::string> &carrier);

  void _UploadPostHelper(int64_t req_id, const Post &post,
                         const std::map<std::string, std::string> &carrier);

  void _UploadHomeTimelineHelper(
      int64_t req_id, int64_t post_id, int64_t user_id, int64_t timestamp,
      const std::vector<int64_t> &user_mentions_id,
      const std::map<std::string, std::string> &carrier);

  Creator _ComposeCreaterHelper(
      int64_t req_id, int64_t user_id, const std::string &username,
      const std::map<std::string, std::string> &carrier);
  TextServiceReturn _ComposeTextHelper(
      int64_t req_id, const std::string &text,
      const std::map<std::string, std::string> &carrier);
  std::vector<Media> _ComposeMediaHelper(
      int64_t req_id, const std::vector<std::string> &media_types,
      const std::vector<int64_t> &media_ids,
      const std::map<std::string, std::string> &carrier);
  int64_t _ComposeUniqueIdHelper(
      int64_t req_id, PostType::type post_type,
      const std::map<std::string, std::string> &carrier);
};

ComposePostHandler::ComposePostHandler(
    ClientPool<social_network::ThriftClient<PostStorageServiceClient>>
        *post_storage_client_pool,
    ClientPool<social_network::ThriftClient<UserTimelineServiceClient>>
        *user_timeline_client_pool,
    ClientPool<ThriftClient<UserServiceClient>> *user_service_client_pool,
    ClientPool<ThriftClient<UniqueIdServiceClient>>
        *unique_id_service_client_pool,
    ClientPool<ThriftClient<MediaServiceClient>> *media_service_client_pool,
    ClientPool<ThriftClient<TextServiceClient>> *text_service_client_pool,
    ClientPool<ThriftClient<HomeTimelineServiceClient>>
        *home_timeline_client_pool) {
  _post_storage_client_pool = post_storage_client_pool;
  _user_timeline_client_pool = user_timeline_client_pool;
  _user_service_client_pool = user_service_client_pool;
  _unique_id_service_client_pool = unique_id_service_client_pool;
  _media_service_client_pool = media_service_client_pool;
  _text_service_client_pool = text_service_client_pool;
  _home_timeline_client_pool = home_timeline_client_pool;
}

Creator ComposePostHandler::_ComposeCreaterHelper(
    int64_t req_id, int64_t user_id, const std::string &username,
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("ComposeCreaterHelper", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);

  auto user_client_wrapper = _user_service_client_pool->Pop();
  if (!user_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to user-service";
    LOG(error) << se.message;
    span_OTEL->End();
    throw se;
  }

  auto user_client = user_client_wrapper->GetClient();
  Creator _return_creator;
  try {
    user_client->ComposeCreatorWithUserId(_return_creator, req_id, user_id,
                                          username, carrier_map.headers_);
  } catch (...) {
    LOG(error) << "Failed to send compose-creator to user-service";
    _user_service_client_pool->Remove(user_client_wrapper);
    span_OTEL->End();
    throw;
  }
  _user_service_client_pool->Keepalive(user_client_wrapper);
  span_OTEL->End();
  return _return_creator;
}

TextServiceReturn ComposePostHandler::_ComposeTextHelper(
    int64_t req_id, const std::string &text,
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("ComposeTextHelper", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);

  auto text_client_wrapper = _text_service_client_pool->Pop();
  if (!text_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to text-service";
    LOG(error) << se.message;
    ;
    span_OTEL->End();
    throw se;
  }

  auto text_client = text_client_wrapper->GetClient();
  TextServiceReturn _return_text;
  try {
    text_client->ComposeText(_return_text, req_id, text, carrier_map.headers_);
  } catch (...) {
    LOG(error) << "Failed to send compose-text to text-service";
    _text_service_client_pool->Remove(text_client_wrapper);
    span_OTEL->End();
    throw;
  }
  _text_service_client_pool->Keepalive(text_client_wrapper);
  span_OTEL->End();
  return _return_text;
}

std::vector<Media> ComposePostHandler::_ComposeMediaHelper(
    int64_t req_id, const std::vector<std::string> &media_types,
    const std::vector<int64_t> &media_ids,
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("ComposeMediaHelper", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);

  auto media_client_wrapper = _media_service_client_pool->Pop();
  if (!media_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to media-service";
    LOG(error) << se.message;
    ;
    span_OTEL->End();
    throw se;
  }

  auto media_client = media_client_wrapper->GetClient();
  std::vector<Media> _return_media;
  try {
    media_client->ComposeMedia(_return_media, req_id, media_types, media_ids,
                               carrier_map.headers_);
  } catch (...) {
    LOG(error) << "Failed to send compose-media to media-service";
    _media_service_client_pool->Remove(media_client_wrapper);
    span_OTEL->End();
    throw;
  }
  _media_service_client_pool->Keepalive(media_client_wrapper);
  span_OTEL->End();
  return _return_media;
}

int64_t ComposePostHandler::_ComposeUniqueIdHelper(
    int64_t req_id, const PostType::type post_type,
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("ComposeUniqueIdHelper", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);
  
  auto unique_id_client_wrapper = _unique_id_service_client_pool->Pop();
  if (!unique_id_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to unique_id-service";
    LOG(error) << se.message;
    span_OTEL->End();
    throw se;
  }

  auto unique_id_client = unique_id_client_wrapper->GetClient();
  int64_t _return_unique_id;
  try {
    _return_unique_id =
        unique_id_client->ComposeUniqueId(req_id, post_type, carrier_map.headers_);
  } catch (...) {
    LOG(error) << "Failed to send compose-unique_id to unique_id-service";
    _unique_id_service_client_pool->Remove(unique_id_client_wrapper);
    span_OTEL->End();
    throw;
  }
  _unique_id_service_client_pool->Keepalive(unique_id_client_wrapper);
  span_OTEL->End();
  return _return_unique_id;
}

void ComposePostHandler::_UploadPostHelper(
    int64_t req_id, const Post &post,
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("UploadPostHelper", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);

  auto post_storage_client_wrapper = _post_storage_client_pool->Pop();
  if (!post_storage_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to post-storage-service";
    LOG(error) << se.message;
    ;
    span_OTEL->End();
    throw se;
  }
  auto post_storage_client = post_storage_client_wrapper->GetClient();
  try {
    post_storage_client->StorePost(req_id, post, carrier_map.headers_);
  } catch (...) {
    _post_storage_client_pool->Remove(post_storage_client_wrapper);
    LOG(error) << "Failed to store post to post-storage-service";
    span_OTEL->End();
    throw;
  }
  _post_storage_client_pool->Keepalive(post_storage_client_wrapper);

  span_OTEL->End();
}

void ComposePostHandler::_UploadUserTimelineHelper(
    int64_t req_id, int64_t post_id, int64_t user_id, int64_t timestamp,
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("UploadUserTimelineHelper", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);

  auto user_timeline_client_wrapper = _user_timeline_client_pool->Pop();
  if (!user_timeline_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to user-timeline-service";
    LOG(error) << se.message;
    ;
    span_OTEL->End();
    throw;
  }
  _user_timeline_client_pool->Keepalive(user_timeline_client_wrapper);

  span_OTEL->End();
}

void ComposePostHandler::_UploadHomeTimelineHelper(
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("UploadHomeTimelineHelper", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);

  auto home_timeline_client_wrapper = _home_timeline_client_pool->Pop();
  if (!home_timeline_client_wrapper) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_CONN_ERROR;
    se.message = "Failed to connect to home-timeline-service";
    LOG(error) << se.message;
    ;
    span_OTEL->End();
    throw se;
  }
  auto home_timeline_client = home_timeline_client_wrapper->GetClient();
  try {
    home_timeline_client->WriteHomeTimeline(req_id, post_id, user_id, timestamp,
                                            user_mentions_id, carrier_map.headers_);
  } catch (...) {
    _home_timeline_client_pool->Remove(home_timeline_client_wrapper);
    LOG(error) << "Failed to write home timeline to home-timeline-service";
    span_OTEL->End();
    throw;
  }
  _home_timeline_client_pool->Keepalive(home_timeline_client_wrapper);

  span_OTEL->End();
}


void ComposePostHandler::ComposePost(
    const int64_t req_id, const std::string &username, int64_t user_id,
    const std::string &text, const std::vector<int64_t> &media_ids,
    const std::vector<std::string> &media_types, const PostType::type post_type,
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

  auto span_OTEL = get_tracer("compose_tracer")->StartSpan("ComposePost", options);
  auto scope = get_tracer("compose_tracer")->WithActiveSpan(span_OTEL);

  auto text_future =
      std::async(std::launch::async, &ComposePostHandler::_ComposeTextHelper,
                 this, req_id, text, carrier_map.headers_);
  auto creator_future =
      std::async(std::launch::async, &ComposePostHandler::_ComposeCreaterHelper,
                 this, req_id, user_id, username, carrier_map.headers_);
  auto media_future =
      std::async(std::launch::async, &ComposePostHandler::_ComposeMediaHelper,
                 this, req_id, media_types, media_ids, carrier_map.headers_);
  auto unique_id_future = std::async(
      std::launch::async, &ComposePostHandler::_ComposeUniqueIdHelper, this,
      req_id, post_type, carrier_map.headers_);

  Post post;
  auto timestamp =
      duration_cast<milliseconds>(system_clock::now().time_since_epoch())
          .count();
  post.timestamp = timestamp;

  // try
  // {
  post.post_id = unique_id_future.get();
  post.creator = creator_future.get();
  post.media = media_future.get();
  auto text_return = text_future.get();
  post.text = text_return.text;
  post.urls = text_return.urls;
  post.user_mentions = text_return.user_mentions;
  post.req_id = req_id;
  post.post_type = post_type;
  // }
  // catch (...)
  // {
  //   throw;
  // }

  std::vector<int64_t> user_mention_ids;
  for (auto &item : post.user_mentions) {
    user_mention_ids.emplace_back(item.user_id);
  }

  //In mixed workloed condition, need to make sure _UploadPostHelper execute
  //Before _UploadUserTimelineHelper and _UploadHomeTimelineHelper.
  //Change _UploadUserTimelineHelper and _UploadHomeTimelineHelper to deferred.
  //To let them start execute after post_future.get() return.
  auto post_future =
      std::async(std::launch::async, &ComposePostHandler::_UploadPostHelper,
                 this, req_id, post, carrier_map.headers_);
  auto user_timeline_future = std::async(
      std::launch::deferred, &ComposePostHandler::_UploadUserTimelineHelper, this,
      req_id, post.post_id, user_id, timestamp, carrier_map.headers_);
  auto home_timeline_future = std::async(
      std::launch::deferred, &ComposePostHandler::_UploadHomeTimelineHelper, this,
      req_id, post.post_id, user_id, timestamp, user_mention_ids,
      carrier_map.headers_);

  // try
  // {
  post_future.get();
  user_timeline_future.get();
  home_timeline_future.get();
  // }
  // catch (...)
  // {
  //   throw;
  // }
  span_OTEL->End();
}

}  // namespace social_network

#endif  // SOCIAL_NETWORK_MICROSERVICES_SRC_COMPOSEPOSTSERVICE_COMPOSEPOSTHANDLER_H_
