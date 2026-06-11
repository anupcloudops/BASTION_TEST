data "azurerm_public_ip" "dpip1" {
   for_each = var.bastions
    name = each.value.pipname1
    resource_group_name = each.value.rgname
}
data "azurerm_subnet" "dsub1" {
    for_each = var.bastions
    name = each.value.subnet1
    virtual_network_name = each.value.vnetname
    resource_group_name = each.value.rgname
}