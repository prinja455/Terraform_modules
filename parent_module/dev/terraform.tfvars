azurerm_resource_group={
    rg_dev01={
        rg_name="rg_app_dev_eastus_001"
        rg_location="eastus"
    }
    reg_dev02={
        rg_name="rg_app_dev_eastus_002"
        rg_location="eastus"
    }
}

azurerm_storage_account = {
    stg_dev01={
        stg_name="stgappdev001"
        rg_name="rg_app_dev_eastus_001"
        rg_location="eastus"
        stg_tier="Standard"
        stg_replication="LRS"
    }
    stg_dev02={
        stg_name="stgappdev002"
        rg_name="rg_app_dev_eastus_002"
        rg_location="eastus"
        stg_tier="Standard"
        stg_replication="LRS"
    }
}