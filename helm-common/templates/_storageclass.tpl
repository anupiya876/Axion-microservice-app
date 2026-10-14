{{- define "axion-common.storageclass" -}}
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: {{ .Values.storageClass.name }}
provisioner: disk.csi.azure.com
parameters:
  skuName: {{ .Values.storageClass.sku | default "Premium_LRS" }}
reclaimPolicy: {{ .Values.storageClass.reclaimPolicy | default "Retain" }}
volumeBindingMode: Immediate
allowVolumeExpansion: true
{{- end }}