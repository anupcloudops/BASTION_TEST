rgs = {
  rg1 = {
    name       = "adevrg"
    location   = "central India"
    managed_by = "Anup"
    tags = {
      envirnment = "test"
      product    = "unique"
      teated     = "OK"
    }
  }
}
vnets = {
  vnet1 = {
    name          = "vnet1"
    location      = "central India"
    rgname        = "adevrg"
    address_space = ["10.0.0.0/24"]
  }
  vnet2 = {
    name          = "vnet2"
    location      = "central India"
    rgname        = "adevrg"
    address_space = ["10.143.0.0/24"]
  }
}
subnets = {
  subnet1 = {
    name             = "subnet1"
    vnetname         = "vnet1"
    rgname           = "adevrg"
    address_prefixes = ["10.0.0.0/26"]
  }
  subnet2 = {
    name             = "subnet2"
    vnetname         = "vnet1"
    rgname           = "adevrg"
    address_prefixes = ["10.0.0.64/26"]
  }
  subnet3 = {
    name             = "AzureBastionSubnet"
    vnetname         = "vnet2"
    rgname           = "adevrg"
    address_prefixes = ["10.143.0.0/26"]
  }
}
nsgs = {
  nsg1 = {
    name                        = "testnsg"
    location                    = "central India"
    rgname                      = "adevrg"
    srname                      = "testsr"
    priority                    = 100
    direction                   = "Inbound"
    protocol                    = "Tcp"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    httpname                    = "testhttp"
    priority1                   = 110
    direction1                  = "Inbound"
    protocol1                   = "Tcp"
    access1                     = "Allow"
    source_port_range1          = "*"
    destination_port_range1     = "80"
    source_address_prefix1      = "*"
    destination_address_prefix1 = "*"
  }
}
storages = {
  storage1 = {
    name                     = "anupdve88888888"
    location                 = "central India"
    rgname                   = "adevrg"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
pips = {
  pip1 = {
    name              = "testpip"
    location          = "central India"
    rgname            = "adevrg"
    allocation_method = "Static"
    sku               = "Standard"
  }
  pip2 = {
    name              = "testpip1"
    location          = "central India"
    rgname            = "adevrg"
    allocation_method = "Static"
    sku               = "Standard"
  }
}
nics = {
  nic1 = {
    name                          = "testnic"
    location                      = "central India"
    rgname                        = "adevrg"
    icname                        = "testic"
    private_ip_address_allocation = "Dynamic"
    subnet                        = "subnet1"
    vnetname                      = "vnet1"
    pipname                       = "testpip"
  }
}
association = {
  association1 = {
    rgname  = "adevrg"
    nicname = "testnic"
    nsgname = "testnsg"
  }
}
vms = {
  vm1 = {
    name                            = "testvm"
    location                        = "central India"
    rgname                          = "adevrg"
    size                            = "Standard_D2s_v3"
    admin_username                  = "adminuser"
    admin_password                  = "Admin@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "canonical"
    offer                           = "0001-com-ubuntu-server-focal"
    version                         = "latest"
    sku                             = "20_04-lts"
    nicname                         = "testnic"
  }
}
bastions = {
  bastion1 = {
    name     = "testbastion"
    location = "central India"
    rgname   = "adevrg"
    subnet1   = "AzureBastionSubnet"
    pipname1 = "testpip1"
    vnetname = "vnet2"
  }
}
peerings = {
  peering1 = {
    vnetnameremote = "vnet2"
    name           = "testpeer"
    location       = "central India"
    rgname         = "adevrg"
    vnetname       = "vnet1"
  }
}