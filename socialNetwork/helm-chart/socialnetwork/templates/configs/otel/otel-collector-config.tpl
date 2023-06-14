{{- define "socialnetwork.templates.otel.otel-collector-config.yml"  }}

receivers:
  jaeger:
    protocols:
      thrift_compact:

  # Dummy receiver that's never used, because a pipeline is required to have one.
  otlp/spanmetrics:
    protocols:
      grpc:
        endpoint: "localhost:65535"

exporters:
  prometheus:
    endpoint: "0.0.0.0:8889"

  jaeger:
    endpoint: "jaeger:14250"
    tls:
      insecure: true

  logging:
    loglevel: debug

processors:
  batch:
  spanmetrics:
    metrics_exporter: prometheus
  
  probabilistic_sampler:
    hash_seed: 22
    sampling_percentage: 10

service:
  pipelines:
    traces:
      receivers: [jaeger]
      processors: [spanmetrics, probabilistic_sampler, batch]
      exporters: [jaeger,logging]
    # The exporter name in this pipeline must match the spanmetrics.metrics_exporter name.
    # The receiver is just a dummy and never used; added to pass validation requiring at least one receiver in a pipeline.
    metrics/spanmetrics:
      receivers: [otlp/spanmetrics]
      exporters: [prometheus]
    metrics:
      receivers: [otlp/spanmetrics]
      # The metrics_exporter must be present in this list.
      exporters: [prometheus]
{{- end }}