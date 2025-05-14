---
# Terraform: main.tf (infraestructura mínima en local con VirtualBox)
resource "virtualbox_vm" "ubuntu_vm" {
  name   = "emulacion_vm"
  image  = "ubuntu-22.04-server-cloudimg-amd64.vdi"
  cpus   = 2
  memory = 2048

  network_adapter {
    type           = "bridged"
    host_interface = "enp0s3" # Adaptador puente según host
  }
}
