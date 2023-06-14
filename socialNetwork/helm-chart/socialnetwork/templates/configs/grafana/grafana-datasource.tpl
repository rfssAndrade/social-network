{{- define "socialnetwork.templates.grafana.grafana-datasource.yaml"  }}
apiVersion: 1

datasources:
  - name: Prometheus
    uid: PBFA97CFB590B2093
    type: prometheus
    url: http://prometheus:9090
  - name: Jaeger
    type: jaeger
    url: http://jaeger:16686
    jsonData:
      nodeGraph:
        enabled: true
{{- end }}