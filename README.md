# Self-managed Helm Charts for Kubernetes

## Before you begin

This [Helm](https://github.com/kubernetes/helm) chart supports installation of the following tools:
1. [swagger-ui](https://github.com/swagger-api/swagger-ui)
2. [it-tools](https://github.com/CorentinTh/it-tools)
3. [Tasks.md](https://github.com/BaldissaraMatheus/Tasks.md)
4. [Dashy](https://github.com/lissy93/dashy)


The prerequisites for this Helm chart is a working **Kubernetes Cluster** and **Helm** installed.

If you don't have a Kubernetes Cluster, create one with [minikube](https://minikube.sigs.k8s.io/docs/start/).

To install Helm, see [Helm Installation guide](https://helm.sh/docs/intro/install/).


## Installation and Configuration

### Swagger UI

To add Swagger UI helm repository, run command:

```bash
helm repo add tooling https://trungtin1011.github.io/tooling/
```


To install the Swagger UI helm chart with a release name `my-release` in `swagger` namespace, run command:

```bash
helm install -n swagger --create-namespace my-release tooling/swagger
```


To update latest changes of the charts from the Helm repository, run commands:
```bash
helm repo update

helm -n swagger upgrade my-release tooling/swagger
```

To configure the Swagger UI deployment, the configurable parameters for Swagger UI Helm chart can be found in `values.yaml` values file. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly.


To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release
```


### IT Tools

To add IT Tools helm repository, run command:

```bash
helm repo add tooling https://trungtin1011.github.io/tooling/
```


To install the IT Tools helm chart with a release name `my-release` in `tooling` namespace, run command:

```bash
helm install -n tooling --create-namespace my-release tooling/it-tools
```


To update latest changes of the charts from the Helm repository, run commands:
```bash
helm repo update

helm -n tooling upgrade my-release tooling/it-tools
```


To configure the IT Tools deployment, the configurable parameters of the it-tools-helm chart can be found in `values.yaml` values file. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly.


To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release
```


### Tasks.md

To add Tasks.md helm repository, run command:

```bash
helm repo add tooling https://trungtin1011.github.io/tooling/
```


To install the Tasks.md helm chart with a release name `my-release` in `task` namespace, run command:

```bash
helm install -n task --create-namespace my-release tooling/tasks-md
```


To update latest changes of the charts from the Helm repository, run commands:
```bash
helm repo update

helm -n task upgrade my-release tooling/tasks-md
```

To configure the Tasks.md deployment, the configurable parameters can be found in `values.yaml` values file. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly.


To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release


### Dashy

To add Dashy helm repository, run command:

```bash
helm repo add tooling https://trungtin1011.github.io/tooling/
```


To install the Tasks.md helm chart with a release name `my-release` in `task` namespace, run command:

```bash
helm install -n task --create-namespace my-release tooling/dashy
```


To update latest changes of the charts from the Helm repository, run commands:
```bash
helm repo update

helm -n task upgrade my-release tooling/dashy
```

To configure the Dashy deployment, the configurable parameters can be found in `values.yaml` values file. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly.


To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release


## License

[Apache License 2.0](/LICENSE)
