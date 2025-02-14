terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
    }
    helm = {
      source  = "hashicorp/helm"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
  }
}

provider "ovh" {
  alias              = "ovh"
  endpoint           = "ovh-eu"
  application_key    = "<your_access_key>"
  application_secret = "<your_application_secret>"
  consumer_key       = "<your_consumer_key>"
}



provider "helm" {
  kubernetes {
   host                   = ovh_cloud_project_kube.my_kube_cluster.kubeconfig_attributes[0].host
   client_certificate     = base64decode(ovh_cloud_project_kube.my_kube_cluster.kubeconfig_attributes[0].client_certificate)
   client_key             = base64decode(ovh_cloud_project_kube.my_kube_cluster.kubeconfig_attributes[0].client_key)
   cluster_ca_certificate = base64decode(ovh_cloud_project_kube.my_kube_cluster.kubeconfig_attributes[0].cluster_ca_certificate)


  }
}


