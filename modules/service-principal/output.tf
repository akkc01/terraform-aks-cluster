output "spn_object_ids" {
  description = "Object IDs of the Service Principals"
  value = {
    for key, spn in azuread_service_principal.axion_spn :
    key => spn.object_id
  }
}


output "spn_client_ids" {
  description = "Client IDs of the Applications"
  value = {
    for key, app in azuread_application.axion_app :
    key => app.client_id
  }
}