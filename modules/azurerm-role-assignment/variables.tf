variable "role_assignment" {
  type = map(object({
    spn_key = string
    aks_key = string
    acr_key = string
  }))
}

variable "spn_object_ids" {
  type = map(string)
}

variable "acr_ids" {
  type = map(string)
}

variable "aks_ids" {
  type = map(string)
}

variable "kubelet_ids" {
  type = map(string)
}