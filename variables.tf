
#variable service_name {
#  type        = string
#  default     = "your_ovh_projec_goes_here"
#}




variable "helm_chart_version" {
  description = "Version of the Argo CD Helm chart to install"
  type        = string
  default     = "5.51.6"
}

variable "argocd_version" {
  description = "Version of Argo CD to install"
  type        = string
  default     = "v2.9.3"
}




variable "enable_upstream_otel_demo" {
    type = bool
    default = false
}

# This a full ecosystem including coroot , so it will clash with an existing coroot operator 
variable "enable_coroot_otel_demo" {
    type = bool
    default = false
}

variable "enable_coroot" {
    type = bool
    default = true
}

variable "enable_argocd" {
    type = bool
    default = true
}





