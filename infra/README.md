# [❮ Back](../README.md)

## Topics

* ➔ [Setup Terraform](./terraform)
* ➔ [Setup Kubernetes Manifests](./kubernetes/manifests)
* ➔ [Setup Kubernetes Helm](./kubernetes/helm)

## Explain

### Terraform

Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently.

### Kubernetes

Kubernetes is an open-source container orchestration platform designed to automate the deployment, scaling, and management of containerized applications.

### Helm

Helm is a tool that streamlines installing and managing Kubernetes applications. Think of it like Apt/Yum/Homebrew for K8S.

```bash
helm upgrade -i xmrig . --create-namespace -n xmrig -f values.yaml
```

### Kind

Kind is a tool for running local Kubernetes clusters using Docker container “nodes”. Kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

```bash
kind create cluster --config kind.yaml
kind delete cluster --config kind.yaml
```
