provider "azurerm" {
  version = "3.55.0"
  features {}
}

resource "azurerm_resource_group" "tf_test" {
  name = "tfmainrg"
  location = "Central US"
}

resource "azurerm_container_group" "tfcg_test" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.tf_test.location
  resource_group_name       = azurerm_resource_group.tf_test.name

  ip_address_type     = "Public"
  dns_name_label      = "binarymaintf"
  os_type             = "Linux"

 container {
      name            = "weatherapi"
      image           = "ajmazhar20/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
 }
}