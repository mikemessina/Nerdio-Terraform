data "azuread_client_config" "current" {}
data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "azuread_application_published_app_ids" "well_known" {}

data "azuread_service_principal" "msgraph" {
  application_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
}

# resource "azuread_service_principal" "msgraph" {
#   client_id    = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
#   use_existing = true
# }
