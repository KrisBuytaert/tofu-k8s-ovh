

locals {
  create_ovh_cluster = var.provider_is_ovh ? 1 : 0
}


resource "ovh_cloud_project_kube" "my_kube_cluster" {
   service_name = "${var.service_name}"
   name         = "my_kube_cluster"
   region       = "GRA7"
   version      = "1.27"
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
   service_name  = "${var.service_name}"
   kube_id       = ovh_cloud_project_kube.my_kube_cluster.id
   name          = "my-pool" //Warning: "_" char is not allowed!
   flavor_name   = "b2-7"
   desired_nodes = 7
   max_nodes     = 7
   min_nodes     = 1
}

#resource "ovh_cloud_project_kube_nodepool" "large_pool" {
#   service_name  = "${var.service_name}"
#   kube_id       = ovh_cloud_project_kube.my_kube_cluster.id
#   name          = "large-pool" //Warning: "_" char is not allowed!
#   flavor_name   = "b2-60"
#   desired_nodes = 6
#   max_nodes     = 6
#   min_nodes     = 1
#}
