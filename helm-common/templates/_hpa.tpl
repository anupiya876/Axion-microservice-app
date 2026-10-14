{{- define "axion-common.hpa" -}}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ .Values.appName }}-hpa
  labels:
    {{- include "axion-common.labels" . | nindent 4 }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ .Values.appName }}-deployment
  minReplicas: {{ .Values.hpa.minReplicas | default 2 }}
  maxReplicas: {{ .Values.hpa.maxReplicas | default 5 }}
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: {{ .Values.hpa.targetCPUUtilization | default 60 }}
  behavior:
    scaleUp:
      stabilizationWindowSeconds: {{ .Values.hpa.scaleUp.stabilizationWindowSeconds | default 0 }}
      policies:
      - type: Percent
        value: {{ .Values.hpa.scaleUp.percentValue | default 100 }}
        periodSeconds: {{ .Values.hpa.scaleUp.periodSeconds | default 60 }}
    scaleDown:
      stabilizationWindowSeconds: {{ .Values.hpa.scaleDown.stabilizationWindowSeconds | default 300 }}
      policies:
      - type: Percent
        value: {{ .Values.hpa.scaleDown.percentValue | default 50 }}
        periodSeconds: {{ .Values.hpa.scaleDown.percentPeriodSeconds | default 100 }}
      - type: Pods
        value: {{ .Values.hpa.scaleDown.podsValue | default 1 }}
        periodSeconds: {{ .Values.hpa.scaleDown.podsPeriodSeconds | default 120 }}
{{- end }}
