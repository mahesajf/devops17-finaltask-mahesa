
terraform {
  required_providers {
    idcloudhost = {
      source = "bapung/idcloudhost"
      version = "0.1.3"
    }
  }
}

provider "idcloudhost" {
  auth_token = "************"
}

resource "idcloudhost_vm" "gate" {
  name = "mahesa-gateway"
  os_name = "ubuntu"
  os_version = "20.04"
  vcpu = 2
  memory = 1024
  disks = 20
  username = "mahesa"
  initial_password = "Mahesa123"
  public_key = "************"
  billing_account_id = "************"
}

resource "idcloudhost_floating_ip" "ipdua" {
  name = "gatewayIP"
  billing_account_id = ************
  assigned_to = idcloudhost_vm.gate.id
}
