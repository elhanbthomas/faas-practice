provider "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "minikube"
}

provider "helm" {
    kubernetes = {
      config_path = "~/.kube/config"
      config_context = "minikube"
    }
}

resource "kubernetes_namespace_v1" "openfaas" {
  metadata {
    name = "openfaas"
  }
}

resource "kubernetes_namespace_v1" "openfaas_fn" {
  metadata {
    name = "openfaas-fn"
  }
}

resource "helm_release" "openfaas" {
    name       = "openfaas"
    repository = "https://openfaas.github.io/faas-netes/"
    chart      = "openfaas"
    namespace  = "openfaas"

    set = [ {
      name = "functionNamespace"
      value = "openfaas-fn"
    },
    
    {
        name = "generateBasicAuth"
        value = "true"
    } ]
}