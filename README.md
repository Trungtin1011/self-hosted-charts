# Self-managed Helm Charts for Kubernetes

## Before you begin

This [Helm](https://github.com/kubernetes/helm) chart supports installation of the following tools:
1. [swagger-ui](https://github.com/swagger-api/swagger-ui)
2. [it-tools](https://github.com/CorentinTh/it-tools)
3. [Tasks.md](https://github.com/BaldissaraMatheus/Tasks.md)
4. [Dashy](https://github.com/lissy93/dashy)
5. [OpenTelemetry Demo](https://github.com/Trungtin1011/opentelemetry-demo)
6. [ByteStash](https://github.com/jordan-dalby/ByteStash)


The prerequisites for this Helm chart is a working **Kubernetes Cluster** and **Helm** installed.

If you don't have a Kubernetes Cluster, create one with [minikube](https://minikube.sigs.k8s.io/docs/start/).

To install Helm, see [Helm Installation guide](https://helm.sh/docs/intro/install/).


## Installation and Configuration

To add the helm repository, run command:

```bash
helm repo add tooling https://trungtin1011.github.io/tooling/
```

To install a helm chart with a release name `my-release` in `ns` namespace, run command:

```bash
helm install -n ns --create-namespace my-release tooling/chart_name
```


To update latest changes of the charts from the Helm repository, run commands:
```bash
helm repo update

helm -n ns upgrade my-release tooling/chart_name
```

To configure the Helm chart deployment, the configurable parameters can be found in `values.yaml` values file. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly.


To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release
```


## License

[Apache License 2.0](/LICENSE)
