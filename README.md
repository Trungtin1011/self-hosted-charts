# Swagger UI Helm Chart for Kubernetes

## Before you begin

This [Helm](https://github.com/kubernetes/helm) chart installs [swagger-ui](https://github.com/swagger-ui-api/swagger-ui) in a Kubernetes cluster.

The prerequisites for this Helm chart is a working **Kubernetes Cluster** and **Helm** installed.

If you don't have a Kubernetes Cluster, create one with [minikube](https://minikube.sigs.k8s.io/docs/start/).

To install Helm, see [Helm Installation guide](https://helm.sh/docs/intro/install/).


## Installation

To add Swagger UI helm repository, run command:

```bash
helm repo add swagger https://trungtin1011.github.io/swagger-ui-helm/
helm repo update
```


To install the Swagger UI helm chart with a release name `my-release` in `swagger` namespace, run command:

```bash
helm install -n swagger --create-namespace my-release swagger/swagger-ui-helm
```


To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release
```

## Configuration

The following table lists the most improtant configurable parameters of the swagger-ui-helm chart and the default values. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly.

### Swagger UI deployment
- `swaggerui.replicaCount`: Number of replicas. Default = `1`
- `swaggerui.imagePullSecrets`: List of names of secrets containing docker registry credentials. Default = `[]`
- `swaggerui.image.repository`: Swagger UI Image name. Default = `swaggerapi/swagger-ui`
- `swaggerui.image.tag`: Swagger UI Image tag. Default = `v5.11.2`
- `swaggerui.image.pullPolicy`: Swagger UI Image pull policy. Default = `IfNotPresent`
- `swaggerui.apikey`: API Key value. Default = `""`
- `swaggerui.base_url`: The base URL of the web application. Default =  `/`
- `swaggerui.enable_cors`: Enable CORS support. Default = `true`
- `swaggerui.allow_embedding`: Allow/disallow embedding. Default = `false`
- `swaggerui.disable_validation`: Disable Swagger validator. Default = `false`
- `swaggerui.extraEnv`: Additional environment variable. Default = `[]`
- `swaggerui.resources`: Swagger UI container's CPU/Memory resource requests/limits. Default = `{}`
- `swaggerui.swagger_config_local`: Existing secret that contains swagger.json file. Default = `""`
- `swaggerui.swagger_config_public`: URL to a swagger.json file on an external host. Default = `https://petstore.swagger.io/v2/swagger.json`
- `swaggerui.swagger_config_s3.enabled`: Configs for swagger.json file that stored in private AWS S3 bucket. Default = `false`
- `swaggerui.swagger_config_s3.s3_bucket_uri`: Bucket URI of S3 bucket. Default = `s3://bucket_name`
- `swaggerui.swagger_config_s3.s3_config_object`: S3 object for Swagger config. Default = `swagger.json`
- `swaggerui.swagger_config_s3.irsa`: IAM Role For Service Account - For EKS-based cluster. Default = `arn:aws:iam::account_id:role/irsa_name`
- `swaggerui.swagger_config_s3.aws_region`: AWS Region for configuring AWS connection. Default = `ap-southeast-1`
- `swaggerui.swagger_config_s3.image.repository`: Image to run initContainer. Default = `amazon/aws-cli`
- `swaggerui.swagger_config_s3.image.pullPolicy`: Image pull policy. Default = `IfNotPresent`
- `swaggerui.swagger_config_s3.image.tag`: Image tag for initContainer. Default = `2.15.15`
- `swaggerui.livenessProbe.enabled`: Whether to enable Liveness Probe settings. Default = true`
- `swaggerui.livenessProbe.httpGet.path`: Liveness Probe HTTP path. Default = `/`
- `swaggerui.livenessProbe.httpGet.port`: Liveness Probe HTTP port. Default = `http`
- `swaggerui.livenessProbe.initialDelaySeconds`: Liveness Probe initialDelaySeconds. Default = `30`
- `swaggerui.livenessProbe.periodSeconds`: Liveness Probe periodSeconds. Default = `30`
- `swaggerui.livenessProbe.timeoutSeconds`: Liveness Probe timeoutSeconds. Default = `10`
- `swaggerui.livenessProbe.failureThreshold`: Liveness Probe failureThreshold. Default = `3`
- `swaggerui.livenessProbe.successThreshold`: Liveness Probe successThreshold. Default = `1`
- `swaggerui.readinessProbe.enabled`: Whether to enable Rediness Probe settings. Default = `true`
- `swaggerui.readinessProbe.httpGet.path`: Rediness Probe HTTP path. Default = `/`
- `swaggerui.readinessProbe.httpGet.port`: Rediness Probe HTTP port. Default = `http`
- `swaggerui.readinessProbe.initialDelaySeconds`: Rediness Probe initialDelaySeconds. Default = `30`
- `swaggerui.readinessProbe.periodSeconds`: Rediness Probe periodSeconds. Default = `30`
- `swaggerui.readinessProbe.timeoutSeconds`: Rediness Probe timeoutSeconds. Default = `10`
- `swaggerui.readinessProbe.failureThreshold`: Rediness Probe failureThreshold. Default =  `3`
- `swaggerui.readinessProbe.successThreshold`: Rediness Probe successThreshold. Default = `1`
- `swaggerui.podAnnotations`: Extra annotations for Swagger UI pods. Default = `{}`
- `swaggerui.podLabels`: Extra labels for Swagger UI pods. Default = `{}`
- `swaggerui.podSecurityContext`: Swagger UI Pods Security Context. Default = `{}
- `swaggerui.containerSecurityContext`: Swagger UI Container Security Context. Default = `{}`
- `swaggerui.nodeSelector`: Node labels selector for Swagger UI pods assignment. Default = `{}`
- `swaggerui.affinity`: Affinity for Swagger UI pods assignment. Default = `{}`
- `swaggerui.tolerations`: Tolerations for Swagger UI pods assignment. Default = `[]`


### Swagger UI Validator**
- `localValidation.enabled`: Whether to enable local validator for Swagger resources. Default = `false`
- `localValidation.imagePullSecrets`: List of names of secrets containing docker registry credentials. Default = `[]`
- `localValidation.image.repository`: Swagger validator image repository. Default = `swaggerapi/swagger-validator-v2`
- `localValidation.image.pullPolicy`: Swagger validator image pull policy. Default = `IfNotPresent`
- `localValidation.image.tag`: Swagger validator image tag. Default = `v2.1.4`
- `localValidation.resources`: Swagger validator container's CPU/Memory resource requests/limits. Default = `{}`
- `localValidation.extraEnv`: Swagger validator extra environment variables. Default = `[]`
- `localValidation.containerSecurityContext`: Swagger validator Container security contexts. Default = `{}`


### Service
- `swaggerui.service.type`: Type of service for swagger-ui frontend. Default = `ClusterIP`
- `swaggerui.service.port`: Port to expose service. Default = `8080`
- `swaggerui.service.annotations`: Service annotations. Default = `{}`
- `swaggerui.service.externalIPs`: List of IPs for externally access. Default = `[]`
- `swaggerui.service.loadBalancerIP`: LoadBalancerIP if service type is `LoadBalancer`. Default = `""`
- `swaggerui.service.loadBalancerSourceRanges`: Address that are allowed when svc is `LoadBalancer`. Default = `[]`


### Ingress
- `swaggerui.ingress.enabled`: Enables Ingress. Default = `false`
- `swaggerui.ingress.annotations`: Ingress annotations. Default = `{}`
- `swaggerui.ingress.path`: Path to access frontend. Default = `/`
- `swaggerui.ingress.host`: Ingress host. Default = `chart-example.local`
- `swaggerui.ingress.tls`: Ingress TLS configuration. Default = `[]`
- `swaggerui.ingress.className`: Ingress ClassName. Default = `""`
- `swaggerui.ingress.pathType`: Ingress Path type. Default = `ImplementationSpecific`


## License

[Apache License 2.0](/LICENSE)
