# Contributor Role Assignment to SPN on ACR 
resource "azurerm_role_assignment" "spn_acr_contributor" {
  for_each             = var.role_assignment
  scope                = var.acr_ids[each.value.acr_key]
  role_definition_name = "Contributor"
  principal_id         = var.spn_object_ids[each.value.spn_key]
}

# Role Assignment for SPN to AKS
resource "azurerm_role_assignment" "spn_aks_contributor" {
  for_each             = var.role_assignment
  scope                = var.aks_ids[each.value.aks_key]
  role_definition_name = "Contributor"
  principal_id         = var.spn_object_ids[each.value.spn_key]
}

# Role Assignment for AKS to pull image from ACR
resource "azurerm_role_assignment" "acr_pull" {
  for_each             = var.role_assignment
  principal_id         = var.kubelet_ids[each.value.aks_key]
  role_definition_name = "AcrPull"
  scope                = var.acr_ids[each.value.acr_key]
}
