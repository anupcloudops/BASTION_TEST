data "azurerm_virtual_network" "dvnet" {
    for_each = var.peerings
    name = each.value.vnetnameremote
    resource_group_name = each.value.rgname
}