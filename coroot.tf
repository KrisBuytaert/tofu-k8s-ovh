locals {
  create_coroot_opentelemetry-demo  = var.enable_coroot_otel_demo ? 1 : 0
}

locals {
  create_coroot = var.enable_coroot ? 1 : 0
}




resource "helm_release" "coroot-operator" {
  count            = local.create_coroot
  name             = "coroot-operator"
  repository       = "https://coroot.github.io/helm-charts"
  chart            = "coroot-operator"
  namespace        = "coroot-operator"
  create_namespace = true
}

resource "helm_release" "coroot" {
  count            = local.create_coroot
  depends_on = [ helm_release.coroot-operator ]
  name             = "coroot"
  repository       = "https://coroot.github.io/helm-charts"
  chart            = "coroot-ce"
  namespace        = "coroot"
  create_namespace = true
  set {
    name = "clickhouse.shards"
    value = "2"
  }
  set {
    name = "clickhouse.replicas"
    value = "2"
  }

}


resource "helm_release" "coroot-opentelemetry-demo" {
  count            = local.create_coroot_opentelemetry-demo
  name             = "otel-demo"
  repository       = "https://coroot.github.io/helm-charts"
  chart            = "otel-demo"
  namespace        = "coroot-otel-demo"
  create_namespace = true
}
