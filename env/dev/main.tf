module "rg" {
  source = "../../module/01_rg"
  rgs    = var.rgs
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/02_vnet"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../module/03_subnet"
  subnets    = var.subnets
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../module/06_nsg"
  nsgs       = var.nsgs
}
module "storage" {
  depends_on = [module.rg]
  source     = "../../module/09_storage"
  storages   = var.storages
}
module "pip" {
  depends_on = [module.rg]
  source     = "../../module/04_pip"
  pips       = var.pips
}
module "nic" {
  depends_on = [module.subnet]
  source     = "../../module/05_network"
  nics       = var.nics
}
module "association" {
  depends_on  = [module.nic, module.nsg]
  source      = "../../module/07_association"
  association = var.association
}
module "vm" {
  depends_on = [module.nic, module.rg]
  source     = "../../module/08_vm"
  vms        = var.vms
}
module "bastion" {
  depends_on = [module.subnet, module.pip]
  source     = "../../module/11_bastion"
  bastions   = var.bastions
}
module "peering" {
  depends_on = [module.subnet, module.vnet]
  source     = "../../module/12_vnet_peering"
  peerings   = var.peerings
}