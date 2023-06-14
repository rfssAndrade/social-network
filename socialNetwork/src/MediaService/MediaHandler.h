#ifndef SOCIAL_NETWORK_MICROSERVICES_SRC_MEDIASERVICE_MEDIAHANDLER_H_
#define SOCIAL_NETWORK_MICROSERVICES_SRC_MEDIASERVICE_MEDIAHANDLER_H_

#include <chrono>
#include <iostream>
#include <string>

#include "../../gen-cpp/MediaService.h"
#include "../logger.h"
#include "../tracing.h"

#include "opentelemetry/trace/context.h"
#include "opentelemetry/trace/provider.h"
#include "opentelemetry/trace/span_startoptions.h"

// 2018-01-01 00:00:00 UTC
#define CUSTOM_EPOCH 1514764800000

namespace social_network {
namespace context = opentelemetry::context;
using namespace opentelemetry::trace;
class MediaHandler : public MediaServiceIf {
 public:
  MediaHandler() = default;
  ~MediaHandler() override = default;

  void ComposeMedia(std::vector<Media> &_return, int64_t,
                    const std::vector<std::string> &,
                    const std::vector<int64_t> &,
                    const std::map<std::string, std::string> &) override;

 private:
};

void MediaHandler::ComposeMedia(
    std::vector<Media> &_return, int64_t req_id,
    const std::vector<std::string> &media_types,
    const std::vector<int64_t> &media_ids,
    const std::map<std::string, std::string> &carrier) {

    // OTEL
    StartSpanOptions options;
    options.kind = SpanKind::kServer; // TODO
    // TODO understand if its calling or being called by other services

    auto provider = opentelemetry::trace::Provider::GetTracerProvider();
    auto tracer = provider->GetTracer("media_handler_tracer");
    auto span_OTEL = tracer->StartSpan("ComposeMedia");
    auto scope = tracer->WithActiveSpan(span_OTEL);

    // HttpTextMapCarrier<opentelemetry::ext::http::client::Headers> carrier_OTEL;
    std::map<std::string, std::string> map_copy(carrier);
    TextMapCarrier carriermap(map_copy);
    auto propagator = opentelemetry::context::propagation::GlobalTextMapPropagator::GetGlobalPropagator();
    auto current_ctx = opentelemetry::context::RuntimeContext::GetCurrent();
    propagator->Inject(carriermap, current_ctx);
    // OTEL
  // Initialize a span
  TextMapReader reader(carrier);
  std::map<std::string, std::string> writer_text_map;
  TextMapWriter writer(writer_text_map);
  auto parent_span = opentracing::Tracer::Global()->Extract(reader);
  auto span = opentracing::Tracer::Global()->StartSpan(
      "compose_media_server", {opentracing::ChildOf(parent_span->get())});
  span->SetTag("span.kind","server");
  opentracing::Tracer::Global()->Inject(span->context(), writer);

  if (media_types.size() != media_ids.size()) {
    ServiceException se;
    se.errorCode = ErrorCode::SE_THRIFT_HANDLER_ERROR;
    se.message =
        "The lengths of media_id list and media_type list are not equal";
    throw se;
  }

  for (int i = 0; i < media_ids.size(); ++i) {
    Media new_media;
    new_media.media_id = media_ids[i];
    new_media.media_type = media_types[i];
    _return.emplace_back(new_media);
  }

  span->Finish();
  span_OTEL->End();
}

}  // namespace social_network

#endif  // SOCIAL_NETWORK_MICROSERVICES_SRC_MEDIASERVICE_MEDIAHANDLER_H_
