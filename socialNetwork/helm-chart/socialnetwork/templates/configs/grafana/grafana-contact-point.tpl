{{- define "socialnetwork.templates.grafana.grafana-contact-point.yaml"  }}
apiVersion: 1

contactPoints:
  - orgId: 1
    name: external-webhook
    receivers:
      - uid: external_webhook
        type: webhook
        settings:
          url: https://webhook.site/852b861f-df51-4579-9c4c-bfd8e276069b
{{- end }}