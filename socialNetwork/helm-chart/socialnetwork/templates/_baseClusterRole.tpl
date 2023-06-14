{{- define "socialnetwork.templates.baseClusterRole" }}

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: {{ .Values.name }}Role
rules:
{{- range $rule := $.Values.ClusterRole.rules }}
- apiGroups: 
  {{- range $group := $rule.apiGroups }}
  {{- if eq $group "" }} 
  - ''
  {{- else }}
  - {{ . }}
  {{- end }}
  {{- end }}
  resources:
  {{- range $rule.resources }}
  - {{ . }}
  {{- end }}
  verbs: [{{ $rule.verbs }}]
{{- end }}
{{- if .Values.ClusterRole.nonResourceURLs }}
- nonResourceURLs: [{{.Values.ClusterRole.nonResourceURLs}}]
  verbs: [{{.Values.ClusterRole.verbs}}]
{{- end }}
{{- end }}