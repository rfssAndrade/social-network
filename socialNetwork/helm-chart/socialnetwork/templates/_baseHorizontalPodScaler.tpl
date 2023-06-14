{{- define "socialnetwork.templates.baseHorizontalPodScaler" }}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  labels:
    service: {{ .Values.name }}
  name: {{ .Values.name }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ .Values.name }}
  minReplicas: {{ .Values.scaling.minReplicas }}
  maxReplicas: {{ .Values.scaling.maxReplicas }}
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: {{ .Values.scaling.averageCpuUtilization }}
  - type: Resource
    resource:
      name: memory
      target:
        type: AverageValue
        averageValue: {{ .Values.scaling.averageMemoryUtilization }}
{{- end}}