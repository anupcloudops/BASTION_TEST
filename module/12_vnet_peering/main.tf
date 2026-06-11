resource "azurerm_virtual_network_peering" "peering" {
  for_each                     = var.peerings
  name                         = each.value.name
  resource_group_name          = each.value.rgname
  virtual_network_name         = each.value.vnetname
  remote_virtual_network_id    = data.azurerm_virtual_network.dvnet[each.key].id
  allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", true)
  allow_forwarded_traffic      = lookup(each.value, "allow_forwarded_traffic", false)
  allow_gateway_transit        = lookup(each.value, "allow_gateway_transit", false)
  use_remote_gateways          = lookup(each.value, "use_remote_gateways", false)
}