{{- define "socialnetwork.templates.baseServiceLb" }}

apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.name }}-lb
spec:
  type: LoadBalancer
  ports:
  - name: "{{ .Values.portLb.port }}"
    port: {{ .Values.portLb.port }}
    {{- if .Values.portLb.protocol}}
    protocol: {{ .Values.portLb.protocol }}
    {{- end}}
    targetPort: {{ .Values.portLb.targetPort }}
  selector:
    service: {{ .Values.name }} 

{{- end }}
