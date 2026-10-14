{{- define "axion-common.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.configMapName }}
data:
  {{- range $key, $value := .Values.configMapData }}
  {{ $key }}: {{ $value | quote }}
  {{- end }}
{{- end }}
