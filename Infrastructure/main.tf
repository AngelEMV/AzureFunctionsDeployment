provider azurerm {
  version = "~> 2.8"
  features {}
}

resource "azurerm_resource_group" "resource-group" {
  location = var.location
  name = var.resourceGroupName
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "storageaccounttest${random_integer.ri.result}"
  resource_group_name      = azurerm_resource_group.resource-group.name
  location                 = azurerm_resource_group.resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "service-plan" {
  name                = "azure-functions-test-service-plan"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "function-app-1" {
  name                       = "function-app-${random_integer.ri.result}"
  location                   = azurerm_resource_group.resource-group.location
  resource_group_name        = azurerm_resource_group.resource-group.name
  app_service_plan_id        = azurerm_app_service_plan.service-plan.id
  storage_account_name       = azurerm_storage_account.storageaccount.name
  storage_account_access_key = azurerm_storage_account.storageaccount.primary_access_key
  version = "~2"
}