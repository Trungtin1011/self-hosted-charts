{{/*
Expand the name of the chart.
*/}}
{{- define "otlpdemo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "otlpdemo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "otlpdemo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "otlpdemo.labels" -}}
helm.sh/chart: {{ include "otlpdemo.chart" . }}
{{ include "otlpdemo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "otlpdemo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "otlpdemo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "otlpdemo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "otlpdemo.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Caller labels and selector
*/}}
{{- define "caller.labels" -}}
helm.sh/chart: {{ include "otlpdemo.chart" . }}
{{ include "caller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "caller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "otlpdemo.name" . }}-caller
app.kubernetes.io/instance: {{ .Release.Name }}-caller
{{- end }}


{{/*
Server labels and selector
*/}}
{{- define "server.labels" -}}
helm.sh/chart: {{ include "otlpdemo.chart" . }}
{{ include "server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "otlpdemo.name" . }}-server
app.kubernetes.io/instance: {{ .Release.Name }}-server
{{- end }}


{{/*
dbclient labels and selector
*/}}
{{- define "dbclient.labels" -}}
helm.sh/chart: {{ include "otlpdemo.chart" . }}
{{ include "dbclient.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "dbclient.selectorLabels" -}}
app.kubernetes.io/name: {{ include "otlpdemo.name" . }}-dbclient
app.kubernetes.io/instance: {{ .Release.Name }}-dbclient
{{- end }}


{{/*
dbservice labels and selector
*/}}
{{- define "dbservice.labels" -}}
helm.sh/chart: {{ include "otlpdemo.chart" . }}
{{ include "dbservice.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "dbservice.selectorLabels" -}}
app.kubernetes.io/name: {{ include "otlpdemo.name" . }}-dbservice
app.kubernetes.io/instance: {{ .Release.Name }}-dbservice
{{- end }}


{{/*
mssql labels and selector
*/}}
{{- define "mssql.labels" -}}
helm.sh/chart: {{ include "otlpdemo.chart" . }}
{{ include "mssql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "mssql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "otlpdemo.name" . }}-mssql
app.kubernetes.io/instance: {{ .Release.Name }}-mssql
{{- end }}
