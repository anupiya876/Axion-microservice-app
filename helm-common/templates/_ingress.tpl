{{- define "axion-common.ingress" -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .Values.appName }}-ingress
  labels:
    {{- include "axion-common.labels" . | nindent 4 }}
  {{- if .Values.ingress.annotations }}
  annotations:
    {{- range $key, $value := .Values.ingress.annotations }}
    {{ $key }}: {{ $value | quote }}
    {{- end }}
  {{- end }}
spec:
  ingressClassName: {{ .Values.ingress.className | default "azure-application-gateway" }}
  rules:
  - host: {{ .Values.ingress.host }}
    http:
      paths:
      - path: {{ .Values.ingress.path | default "/" }}
        pathType: {{ .Values.ingress.pathType | default "Prefix" }}
        backend:
          service:
            name: {{ .Values.appName }}-service
            port:
              number: {{ .Values.service.port }}
{{- end }}