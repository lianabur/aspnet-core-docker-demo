# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.16.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
    subscription_id = "af59a50c-7a7b-4815-b615-641990427b44"
    client_id     = "2f78554c-91fd-424f-aade-aaa3af7cc2db"
    client_secret = "xOZ8Q~hAEXHCDbqK.eRXE5wJ2RRfWulnjhFg1bkB"
    tenant_id     = "a047dbfb-d5eb-47f3-8d21-381786ab6c80"
}

resource "azurerm_container_registry" "tgeorgecr" {
  name                     = "tgeorgecr"
  resource_group_name      = "Tolan_George"
  location                 = "West Europe"
  sku                      = "Basic"
  admin_enabled            = true
}

resource "azurerm_app_service_plan" "tgeorgeASP" {  
  name                = "tgeorgeASP"  
  location            = "West Europe"  
  resource_group_name = "Tolan_George"  

  sku {  
    tier = "Standard"  
    size = "S1"  
  }  
}   

resource "azurerm_app_service" "tgeorgeWEB" {  
  name                = "tgeorgeWEB"  
  location            = "West Europe"  
  resource_group_name = "Tolan_George"  
  app_service_plan_id = azurerm_app_service_plan.tgeorgeASP.id  
  
}
