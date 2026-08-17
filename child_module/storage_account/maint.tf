resource "azurerm_storage_account" "stg"{
    for_each = var.azurerm_storage_account
    name = each.value.stg_name
    location = each.value.rg_location
    resource_group_name = each.value.rg_name
    account_tier = each.value.stg_tier
    account_replication_type = each.value.stg_replication


  
}