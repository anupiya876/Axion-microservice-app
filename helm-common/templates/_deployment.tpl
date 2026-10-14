{{- define "axion-common.deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.appName }}-deployment
  labels:
    {{- include "axion-common.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicas | default 1 }}
  selector:
    matchLabels:
      {{- include "axion-common.labels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "axion-common.labels" . | nindent 8 }}
    spec:
      nodeSelector:
        kubernetes.azure.com/agentpool: {{ .Values.nodePool | default "anunode" }}
      containers:
      - name: {{ .Values.appName }}-container
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
        {{- if .Values.extraEnv }}
        env:
          {{- toYaml .Values.extraEnv | nindent 10 }}
        {{- end }}
        {{- if or .Values.configMapRef .Values.secretRef }}
        envFrom:
        {{- if .Values.configMapRef }}
        - configMapRef:
            name: {{ .Values.configMapRef }}
        {{- end }}
        {{- if .Values.secretRef }}
        - secretRef:
            name: {{ .Values.secretRef }}
        {{- end }}
        {{- end }}
        resources:
          {{- toYaml .Values.resources | nindent 10 }}
        {{- if .Values.port }}
        ports:
        - containerPort: {{ .Values.port }}
        {{- end }}
        {{- if .Values.readinessProbe }}
        readinessProbe:
          httpGet:
            path: {{ .Values.readinessProbe.path }}
            port: {{ .Values.readinessProbe.port | default .Values.port }}
          initialDelaySeconds: {{ .Values.readinessProbe.initialDelaySeconds | default 5 }}
          periodSeconds: {{ .Values.readinessProbe.periodSeconds | default 10 }}
          timeoutSeconds: {{ .Values.readinessProbe.timeoutSeconds | default 3 }}
          failureThreshold: {{ .Values.readinessProbe.failureThreshold | default 3 }}
        {{- end }}
        {{- if .Values.livenessProbe }}
        livenessProbe:
          httpGet:
            path: {{ .Values.livenessProbe.path }}
            port: {{ .Values.livenessProbe.port | default .Values.port }}
          initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds | default 15 }}
          periodSeconds: {{ .Values.livenessProbe.periodSeconds | default 15 }}
          timeoutSeconds: {{ .Values.livenessProbe.timeoutSeconds | default 3 }}
          failureThreshold: {{ .Values.livenessProbe.failureThreshold | default 3 }}
        {{- end }}
        {{- if .Values.volumeMounts }}
        volumeMounts:
          {{- toYaml .Values.volumeMounts | nindent 10 }}
        {{- end }}
      {{- if .Values.volumes }}
      volumes:
        {{- toYaml .Values.volumes | nindent 8 }}
      {{- end }}
{{- end }}