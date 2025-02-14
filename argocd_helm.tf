
locals {
  create_argocd = var.enable_argocd ? 1 : 0
}


resource "helm_release" "argocd" {
  count            = local.create_argocd
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = var.helm_chart_version

  values = [
    <<-EOT
    global:
      image:
        tag: ${var.argocd_version}

    server:
      extraArgs:
        - --insecure
      service:
        type: LoadBalancer
      ingress:
        enabled: false

    redis-ha:
      enabled: false

    controller:
      replicas: 1

    repoServer:
      replicas: 1

    applicationSet:
      enabled: true

    notifications:
      enabled: true

    EOT
  ]
}
