module "resource_group" {
    source = "../../child_module/resource_group"
    azurerm_resource_group = var.azurerm_resource_group
  
}
module "storage_account" {
    source = "../../child_module/storage_account"
    azurerm_storage_account = var.azurerm_storage_account
    depends_on = [module.resource_group]
}