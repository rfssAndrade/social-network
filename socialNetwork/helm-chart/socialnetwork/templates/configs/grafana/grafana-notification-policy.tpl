{{- define "socialnetwork.templates.grafana.grafana-notification-policy.yaml"  }}
apiVersion: 1

policies:
  - orgId: 1
    receiver: external-webhook
    matchers:
      - CustomRoute = true
{{- end }}