output "vm_public_ips" {
  value       = { for k, pip in azurerm_public_ip.pipblock : k => pip.ip_address }
}