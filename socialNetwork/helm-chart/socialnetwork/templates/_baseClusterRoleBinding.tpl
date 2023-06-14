{{- define "socialnetwork.templates.baseClusterRoleBinding" }}

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{ .Values.name }}RoleBinding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: {{ .Values.name }}Role
subjects:
- kind: ServiceAccount
  name: {{ .Values.clusterrolebinding.serviceaccount.name | default "default"  }}
  namespace: {{ .Values.clusterrolebinding.serviceaccount.namespace | default "default" }}

{{- end }}