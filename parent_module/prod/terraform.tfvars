azurerm_resource_group={
    rg_prod01={
        rg_name="rg_app_prod_eastus_001"
        rg_location="eastus"
    }
    reg_prod02={
        rg_name="rg_app_prod_eastus_002"
        rg_location="eastus"
    }
}

azurerm_storage_account = {
    stg_prod01={
        stg_name="stgappprod001"
        rg_name="rg_app_prod_eastus_001"
        rg_location="eastus"
        stg_tier="Standard"
        stg_replication="LRS"
    }
    stg_prod02={
        stg_name="stgappprod002"
        rg_name="rg_app_prod_eastus_002"
        rg_location="eastus"
        stg_tier="Standard"
        stg_replication="LRS"
    }
}