azurerm_resource_group={
    rg_test01={
        rg_name="rg_app_test_eastus_001"
        rg_location="eastus"
    }
    reg_test02={
        rg_name="rg_app_test_eastus_002"
        rg_location="eastus"
    }
}

azurerm_storage_account = {
    stg_test01={
        stg_name="stgapptest001"
        rg_name="rg_app_test_eastus_001"
        rg_location="eastus"
        stg_tier="Standard"
        stg_replication="LRS"
    }
    stg_test02={
        stg_name="stgapptest002"
        rg_name="rg_app_test_eastus_002"
        rg_location="eastus"
        stg_tier="Standard"
        stg_replication="LRS"
    }
}