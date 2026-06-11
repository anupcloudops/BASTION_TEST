resource "azurerm_network_security_group" "nsgblock" {
    for_each = var.nsgs
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.rgname
    security_rule {
        name = each.value.srname
        priority = each.value.priority
        direction = each.value.direction
        access = each.value.access
        protocol = each.value.protocol
        source_address_prefix = each.value.source_address_prefix
        destination_address_prefix = each.value.destination_address_prefix
        source_port_range = each.value.source_port_range
        destination_port_range = each.value.destination_port_range
    }
        security_rule {
        name = each.value.httpname
        priority = each.value.priority1
        direction = each.value.direction1
        access = each.value.access1
        protocol = each.value.protocol1
        source_address_prefix = each.value.source_address_prefix1
        destination_address_prefix = each.value.destination_address_prefix1
        source_port_range = each.value.source_port_range1
        destination_port_range = each.value.destination_port_range1
    }
}