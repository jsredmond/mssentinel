resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.company_name}-log-analytics-workspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id               = azurerm_log_analytics_workspace.law.id
  customer_managed_key_enabled = var.customer_managed_key_enabled
}

# resource "azurerm_sentinel_data_connector_azure_active_directory" "connector_aad" {
#   name                       = "${var.company_name}_connector_aad"
#   log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
# }

resource "azurerm_sentinel_data_connector_office_365" "connector_o365" {
  name                       = "${var.company_name}_connector_o365"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}