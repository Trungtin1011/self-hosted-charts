# Swagger UI Helm Chart for Kubernetes

## Before you begin

This [Helm](https://github.com/kubernetes/helm) chart installs [swagger-ui](https://github.com/swagger-api/swagger-ui) in a Kubernetes cluster.

The prerequisites for this Helm chart is a working **Kubernetes Cluster** and **Helm** installed.

If you don't have a Kubernetes Cluster, create one with [minikube](https://minikube.sigs.k8s.io/docs/start/).

To install Helm, see [Helm Installation guide](https://helm.sh/docs/intro/install/).


## Installation and Upgrading

To add Swagger UI helm repository, run command:

```bash
helm repo add swagger https://trungtin1011.github.io/swagger-ui-helm/
```


To install the Swagger UI helm chart with a release name `my-release` in `swagger` namespace, run command:

```bash
helm install -n swagger --create-namespace my-release swagger/swagger
```


To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release
```

To update latest changes of the charts from the Helm repository, run commands:
```bash
helm repo update

helm -n swagger upgrade my-release swagger/swagger
```


## Important Configuration Parameters

The following table lists the most improtant configurable parameters of the swagger-ui-helm chart and the default values. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly.

Parameters that are not as important can be found in `values.yaml` file.


### Swagger UI deployment
- `swaggerui.apikey`: API Key value. Default = `""`
- `swaggerui.base_url`: The base URL of the web application. Default =  `/`
- `swaggerui.enable_cors`: Enable CORS support. Default = `true`
- `swaggerui.allow_embedding`: Allow/disallow embedding. Default = `false`
- `swaggerui.disable_validation`: Disable Swagger validator. Default = `false`
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


### Swagger UI Validator
- `localValidation.enabled`: Whether to enable local validator for Swagger resources. Default = `false`
- `localValidation.image.repository`: Swagger validator image repository. Default = `swaggerapi/swagger-validator-v2`
- `localValidation.image.tag`: Swagger validator image tag. Default = `v2.1.4`
- `localValidation.resources`: Swagger validator container's CPU/Memory resource requests/limits. Default = `{}`
- `localValidation.extraEnv`: Swagger validator extra environment variables. Default = `[]`
- `localValidation.serviceType`: Swagger validator service type. Default = `ClusterIP`
- `localValidation.ingress.enabled`: Swagger validator ingress. Default = `false`


## License

[Apache License 2.0](/LICENSE)
