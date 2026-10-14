{{- define "axion-common.secret" -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Values.secretName }}
type: Opaque
stringData:
  {{- range $key, $value := .Values.secretData }}
  {{ $key }}: {{ $value | quote }}
  {{- end }}
{{- end }}