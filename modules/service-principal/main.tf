resource "azuread_application" "axion_app" {

  for_each = var.spns

  display_name = each.value.application_name
}


resource "azuread_service_principal" "axion_spn" {

  for_each = var.spns

  client_id = azuread_application.axion_app[each.key].client_id

  description = each.value.service_principal_name
}