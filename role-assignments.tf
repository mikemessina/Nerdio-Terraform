# resource "azuread_app_role_assignment" "desktop_admins" {
#   for_each = var.desktop_admins

#   principal_object_id = each.value
#   resource_object_id  = azuread_service_principal.nerdio_manager.object_id
#   app_role_id         = azuread_service_principal.nerdio_manager.app_role_ids[DesktopAdmin]
# }

# resource "azuread_app_role_assignment" "desktop_users" {
#   for_each = var.desktop_users

#   principal_object_id = each.value
#   resource_object_id  = azuread_service_principal.nerdio_manager.object_id
#   app_role_id         = azuread_service_principal.nerdio_manager.app_role_ids[EndUser]
# }

# resource "azuread_app_role_assignment" "help_desk" {
#   for_each = var.helpdesk_users

#   principal_object_id = each.value
#   resource_object_id  = azuread_service_principal.nerdio_manager.object_id
#   app_role_id         = azuread_service_principal.nerdio_manager.app_role_ids[HelpDesk]
# }

# resource "azuread_app_role_assignment" "reviewers" {
#   for_each = var.reviewers

#   principal_object_id = each.value
#   resource_object_id  = azuread_service_principal.nerdio_manager.object_id
#   app_role_id         = azuread_service_principal.nerdio_manager.app_role_ids[Reviewer]
# }

# resource "azuread_app_role_assignment" "wvd_admin" {
#   for_each = var.nerdio_admins

#   principal_object_id = each.value
#   resource_object_id  = azuread_service_principal.nerdio_manager.object_id
#   app_role_id         = azuread_service_principal.nerdio_manager.app_role_ids[WvdAdmin]
# }
