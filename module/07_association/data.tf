data "azurerm_network_interface" "dni"{
    for_each = var.association
    name = each.value.nicname
    resource_group_name = each.value.rgname
}
data "azurerm_network_security_group" "dnsg" {
     for_each = var.association
    name = each.value.nsgname
    resource_group_name = each.value.rgname
}