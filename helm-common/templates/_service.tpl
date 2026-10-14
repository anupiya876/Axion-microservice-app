{{- define "axion-common.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.appName }}-service
  labels:
    {{- include "axion-common.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type | default "ClusterIP" }}
  selector:
    {{- include "axion-common.labels" . | nindent 4 }}
  ports:
  - port: {{ .Values.service.port }}
    targetPort: {{ .Values.service.targetPort | default .Values.port }}
{{- end }}
