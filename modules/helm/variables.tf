variable "nginx-ingress_namespace" {
  type    = string
  default = "nginx-ingress"
}
variable "namemaster_namespace" {
  type    = string
  default = "namemaster"
}
variable "cert-manager_namespace" {
  type    = string
  default = "cert-manager"
}
variable "gitlab-runner_namespace" {
  type    = string
  default = "gitlab-runner"
}
variable "monitoring_namespace" {
  type    = string
  default = "monitoring"
}
variable "cluster_endpoint" {
  type    = string
}
variable "cluster_name" {
  type    = string
  default = "cluster_name"
}
variable "cluster_certificate_authority_data" {
  type    = string
  default = "cluster_certificate_authority_data"
}