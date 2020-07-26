# kubernetes-environment

The goal of this project is to have some examples using [`Kubernetes`](https://kubernetes.io) ([`Minikube`](https://github.com/kubernetes/minikube))

## Prerequisites

- **Tools**

  - [`Kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  - [`Minikube`](https://kubernetes.io/docs/tasks/tools/install-minikube/)
  - [`Helm`](https://helm.sh/docs/intro/install/)

- **Helm Chart Repositories**

  You must have the following `repo`'s added in your helm chart repository list.
  ```
  NAME            URL
  bitnami         https://charts.bitnami.com/bitnami
  codecentric     https://codecentric.github.io/helm-charts/
  kong            https://charts.konghq.com
  stable          https://kubernetes-charts.storage.googleapis.com/
  incubator       http://storage.googleapis.com/kubernetes-charts-incubator/
  ```

  In order to check it, run
  ```
  helm repo list
  ```

  If some of them is missing, here are the commands to add
  ```
  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm repo add codecentric https://codecentric.github.io/helm-charts/
  helm repo add kong https://charts.konghq.com
  helm repo add stable https://kubernetes-charts.storage.googleapis.com/
  helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/
  ```

  Finally, run the command below to get the latest information about charts from the chart repositories
  ```
  helm repo update
  ``` 

## Examples

- ### [author-book-review-graphql](https://github.com/ivangfr/kubernetes-environment/tree/master/author-book-review-graphql#kubernetes-environment)
- ### [bookservice-kong-keycloak](https://github.com/ivangfr/kubernetes-environment/tree/master/bookservice-kong-keycloak#kubernetes-environment)
- ### [user-event-sourcing-monitoring](https://github.com/ivangfr/kubernetes-environment/tree/master/user-event-sourcing-monitoring#kubernetes-environment)

## Start Minikube

Open a terminal and start `Minikube` by running the following command. The properties `--memory` and `--vm-driver` are optional
```
minikube start --memory='8000mb' --vm-driver='virtualbox'
```

## Shutdown Minikube

The following command shuts down the `Minikube Virtual Machine`, but preserves all cluster state and data. Starting the cluster again will restore it to its previous state.
```
minikube stop
```

The command shuts down and deletes the `Minikube Virtual Machine`. No data or state is preserved.
```
minikube delete
```
