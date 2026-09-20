variable "spns" {
  type = map(object({
    application_name        = string
    service_principal_name  = string
  }))
}