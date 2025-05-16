<!-- BEGIN_DOCS -->
# [❮ Back](https://github.com/lpsm-dev/docker-crypto-miner)

## ➤ Topics

* ➔ [Setup Terraform](./terraform)
* ➔ [Setup Kubernetes Manifests](./kubernetes/manifests)
* ➔ [Setup Kubernetes Helm](./kubernetes/helm)

## ➤ Explain

**Terraform**

Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently.

**Kubernetes**

Kubernetes is an open-source container orchestration platform designed to automate the deployment, scaling, and management of containerized applications.

**K9S**

K9s is a terminal based UI to interact with your Kubernetes clusters. The aim of this project is to make it easier to navigate, observe and manage your deployed applications in the wild. K9s continually watches Kubernetes for changes and offers subsequent commands to interact with your observed resources.

**Kind**

Kind is a tool for running local Kubernetes clusters using Docker container "nodes". Kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

```bash
kind create cluster --config kind.yaml
kind delete cluster
```

**Helm**

Helm is a tool that streamlines installing and managing Kubernetes applications. Think of it like Apt/Yum/Homebrew for K8S.

```bash
docker build -t xmrig:main .
kind load docker-image xmrig:main
helm upgrade -i xmrig . --create-namespace -n xmrig -f values.yaml
kubectl get ns
kubectl get pod -n xmrig
k9s
```
<!-- END_DOCS -->
