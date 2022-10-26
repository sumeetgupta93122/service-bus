terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.27.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "15ba31d6-5b52-4022-a882-cbd46c6229b7"
  client_id       = "3c5fcb93-a88f-41d6-bb97-3f697e12a0e1"
  client_secret   = "EN68Q~dKjCgy.aTL7Afo6e_~Ate2OqeP.0SAnbpM"
  tenant_id       = "03253e68-2aa8-418c-9058-7c8ddd9b1d1e"
  features {}
}



resource "azurerm_resource_group" "app_grp"{
  name="app-grp" 
  location="North Europe"
}

resource "azurerm_servicebus_namespace" "Sbus" {
  name                = "ServiceBus9582"
  location            = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "queue" {
  name         = "queue121"
  namespace_id = azurerm_servicebus_namespace.Sbus.id
}

# resource "azurerm_servicebus_queue" "queue" {
#   name         = "queue"
#   resource_group_name = azurerm_resource_group.app_grp.name
#   namespace_id = azurerm_servicebus_namespace.Sbus.id
#   enable_partitioning = true
# }
