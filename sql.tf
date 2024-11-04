resource "azurerm_mssql_database" "nerdio" {
  name      = "Nerdio"
  server_id = azurerm_mssql_server.nerdio.id
  collation = "Latin1_General_CI_AS"
  sku_name  = var.sql_sku

  zone_redundant = false

  tags = var.tags
}

resource "azurerm_mssql_server" "nerdio" {
  name                = "${lower(var.base_name)}-sql-01"
  location            = azurerm_resource_group.nerdio.location
  resource_group_name = azurerm_resource_group.nerdio.name

  version             = "12.0"
  minimum_tls_version = "1.2"
  connection_policy   = "Default"

  public_network_access_enabled        = var.allow_public_access
  outbound_network_restriction_enabled = true

  azuread_administrator {
    login_username              = azuread_group.sql_admins.display_name
    object_id                   = azuread_group.sql_admins.object_id
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    azuread_authentication_only = true
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

#
# Azure AD Admin Group
#
resource "azuread_group" "sql_admins" {
  display_name            = "Azure SQL Server Administrators - ${lower(var.base_name)}-sql-01"
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azuread_group_member" "nerdio_webapp_sql_admin" {
  group_object_id  = azuread_group.sql_admins.id
  member_object_id = azurerm_windows_web_app.nerdio.identity[0].principal_id
}

#
# Private Endpoint
#
resource "azurerm_private_endpoint" "sql" {
  name                = "${azurerm_mssql_server.nerdio.name}-ple"
  resource_group_name = azurerm_mssql_server.nerdio.resource_group_name
  location            = azurerm_mssql_server.nerdio.location
  subnet_id           = azurerm_subnet.private_endpoints.id

  private_dns_zone_group {
    name = azurerm_mssql_server.nerdio.name
    private_dns_zone_ids = [
      azurerm_private_dns_zone.private_link["sqlserver"].id
    ]
  }

  private_service_connection {
    name                           = "Nerdio"
    private_connection_resource_id = azurerm_mssql_server.nerdio.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

  tags = var.tags
}
