resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastions
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.dsub1[each.key].id
    public_ip_address_id = data.azurerm_public_ip.dpip1[each.key].id
  }
}