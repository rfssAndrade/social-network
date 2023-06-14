{{- define "socialnetwork.templates.grafana.grafana-dashboard-loader.yaml"  }}
apiVersion: 1

providers:
  - name: 'Cluster performance'
    allowUiUpdates: false
    options:
      path: /etc/grafana/provisioning/dashboards/
{{- end }}