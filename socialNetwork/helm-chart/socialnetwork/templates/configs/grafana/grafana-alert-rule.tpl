{{- define "socialnetwork.templates.grafana.grafana-alert-rule.yaml"  }}
# config file version
apiVersion: 1

groups:
  - orgId: 1
    name: Alerts
    folder: Alerts
    interval: 10s
    rules:
      - uid: cpu_alert
        title: CPU usage alert
        condition: B
        data:
          - refId: A
            datasourceUid: 'PBFA97CFB590B2093'
            model:
              editorMode: code
              expr: 'sum by (instance)(rate(node_cpu_seconds_total{mode="system",instance="node-exporter:9100",job="node-exporter"}[$__rate_interval])) * 100'
              hide: false
              intervalMs: 1000
              legendFormat: __auto
              maxDataPoints: 43200
              range: true
              refId: A
            relativeTimeRange:
              from: 10
              to: 0
          - refId: B
            datasourceUid: '-100'
            model:
              conditions:
              - evaluator:
                  params:
                    - 10
                  type: gt
                operator:
                  type: and
                query:
                  params:
                    - A
                reducer:
                  params: []
                  type: avg
                type: query
              datasource:
                type: __expr__
                uid: '-100'
              expression: A
              hide: false
              intervalMs: 1000
              maxDataPoints: 43200
              refId: B
              type: classic_conditions
            relativeTimeRange:
              from: 10
              to: 0
        dashboardUid: 'rYdddlPWk'
        panelId: 77
        noDataState: Alerting
        for: 10s
        labels:
          CustomRoute: true
        annotations:
          __dashboardUid__: 'rYdddlPWk'
          __panelId__: 77
{{- end }}