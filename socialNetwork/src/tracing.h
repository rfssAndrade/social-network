#include <utility>

#ifndef SOCIAL_NETWORK_MICROSERVICES_TRACING_H
#define SOCIAL_NETWORK_MICROSERVICES_TRACING_H

#include <string>
#include <yaml-cpp/yaml.h>
#include <jaegertracing/Tracer.h>

#include <opentracing/propagation.h>
#include <string>
#include <map>
#include "logger.h"

#include "opentelemetry/exporters/otlp/otlp_http_exporter_factory.h"
#include "opentelemetry/exporters/otlp/otlp_http_exporter_options.h"
#include "opentelemetry/sdk/trace/simple_processor_factory.h"
#include "opentelemetry/sdk/trace/tracer_provider_factory.h"
#include "opentelemetry/context/propagation/global_propagator.h"
#include "opentelemetry/context/propagation/text_map_propagator.h"
#include "opentelemetry/trace/provider.h"
#include "opentelemetry/sdk/trace/tracer_context_factory.h"
#include "opentelemetry/trace/propagation/http_trace_context.h"
#include "opentelemetry/trace/provider.h"
#include "opentelemetry/nostd/shared_ptr.h"
#include "opentelemetry/exporters/otlp/otlp_grpc_exporter_factory.h"

//#include "opentelemetry/trace/propagation/jaeger.h"
//#include "opentelemetry/exporters/jaeger/jaeger_exporter_factory.h"

namespace trace     = opentelemetry::trace;
namespace nostd     = opentelemetry::nostd;
namespace trace_sdk = opentelemetry::sdk::trace;
namespace otlp      = opentelemetry::exporter::otlp;
//namespace jaeger    = opentelemetry::exporter::jaeger;

namespace  {

using opentracing::expected;
using opentracing::string_view;
opentelemetry::exporter::otlp::OtlpHttpExporterOptions opts;
//opentelemetry::exporter::jaeger::JaegerExporterOptions jopts;



class TextMapReader : public opentracing::TextMapReader {
 public:
  explicit TextMapReader(const std::map<std::string, std::string> &text_map)
      : _text_map(text_map) {}

  expected<void> ForeachKey(
      std::function<expected<void>(string_view key, string_view value)> f)
  const override {
    for (const auto& key_value : _text_map) {
      auto result = f(key_value.first, key_value.second);
      if (!result) return result;
    }
    return {};
  }

 private:
  const std::map<std::string, std::string>& _text_map;
};

class TextMapCarrier : public opentelemetry::context::propagation::TextMapCarrier
{
public:
  TextMapCarrier(std::map<std::string, std::string> &headers) : headers_(headers) {}
  TextMapCarrier() = default;
  virtual nostd::string_view Get(nostd::string_view key) const noexcept override
  {
    auto it = headers_.find(std::string(key));
    if (it != headers_.end())
    {
      return nostd::string_view(it->second);
    }
    return "";
  }
  virtual void Set(nostd::string_view key, nostd::string_view value) noexcept override
  {
    headers_[std::string(key)] = std::string(value);
  }

  std::map<std::string, std::string> headers_;
};

class TextMapWriter : public opentracing::TextMapWriter {
 public:
  explicit TextMapWriter(std::map<std::string, std::string> &text_map)
    : _text_map(text_map) {}

  expected<void> Set(string_view key, string_view value) const override {
    _text_map[key] = value;
    return {};
  }

 private:
  std::map<std::string, std::string>& _text_map;
};

void SetUpTracer(
    const std::string &config_file_path,
    const std::string &service) {

    opentelemetry::exporter::otlp::OtlpGrpcExporterOptions opts; 
    opts.endpoint = "otel-collector:4317"; 
    auto exporter  = opentelemetry::exporter::otlp::OtlpGrpcExporterFactory::Create(opts);
    //auto exporter  = jaeger::JaegerExporterFactory::Create(jopts);
    auto processor = trace_sdk::SimpleSpanProcessorFactory::Create(std::move(exporter));
    std::shared_ptr<opentelemetry::trace::TracerProvider> provider =
        trace_sdk::TracerProviderFactory::Create(std::move(processor));
    // Set the global trace provider
    trace::Provider::SetTracerProvider(provider);
  // set global propagator
    opentelemetry::context::propagation::GlobalTextMapPropagator::SetGlobalPropagator(
        opentelemetry::nostd::shared_ptr<opentelemetry::context::propagation::TextMapPropagator>(
            new opentelemetry::trace::propagation::HttpTraceContext()));

  LOG(error) << "Tracer initialized ..";

 auto configYAML = YAML::LoadFile(config_file_path);

  // Enable local Jaeger agent, by prepending the service name to the default
  // Jaeger agent's hostname
  //configYAML["reporter"]["localAgentHostPort"] = service + "-" +
  //    configYAML["reporter"]["localAgentHostPort"].as<std::string>();

  auto config = jaegertracing::Config::parse(configYAML);

  bool r = false;
  while (!r) {
    try
    {
      auto tracer = jaegertracing::Tracer::make(
        service, config, jaegertracing::logging::consoleLogger());
      r = true;
      opentracing::Tracer::InitGlobal(
      std::static_pointer_cast<opentracing::Tracer>(tracer));
    }
    catch(...)
    {
      LOG(error) << "Failed to connect to jaeger, retrying ...";
      sleep(1);
    }
  }


}


} //namespace social_network

#endif //SOCIAL_NETWORK_MICROSERVICES_TRACING_H
