{{- define "axion-common.pvc" -}}
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ .Values.pvc.name }}
spec:
  accessModes:
    - {{ .Values.pvc.accessMode | default "ReadWriteOnce" }}
  resources:
    requests:
      storage: {{ .Values.pvc.storage }}
  storageClassName: {{ .Values.pvc.storageClassName }}
{{- end }}
