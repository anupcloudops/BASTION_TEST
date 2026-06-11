output "rg_id" {
  value       = { for k, rg in azurerm_resource_group.rgblock : k => rg.id }
}