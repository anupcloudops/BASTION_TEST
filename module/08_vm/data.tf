data "azurerm_network_interface" "dni"{
    for_each = var.vms
    name = each.value.nicname
    resource_group_name = each.value.rgname
}