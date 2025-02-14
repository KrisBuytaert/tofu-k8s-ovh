
locals {
  create_opentelemetry-demo  = var.enable_upstream_otel_demo ? 1 : 0
}



resource "helm_release" "opentelemetry-demo" {
  count            = local.create_opentelemetry-demo 
  name             = "opentelemetry-demo"
  repository       = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart            = "opentelemetry-demo"
  namespace        = "otel-demo"
  create_namespace = true

}
