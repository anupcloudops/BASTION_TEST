data "azurerm_subnet" "dsub" {
    for_each = var.nics
    name = each.value.subnet
    virtual_network_name = each.value.vnetname
    resource_group_name = each.value.rgname
}
data "azurerm_public_ip" "dpip" {
    for_each = var.nics
    name = each.value.pipname
    resource_group_name = each.value.rgname
}