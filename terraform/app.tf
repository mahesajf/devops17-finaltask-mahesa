
terraform { 
  required_providers {
    idcloudhost = {
      version = "0.1.0"
      source  = "bapung/idcloudhost" 
    }
  }
}

provider "idcloudhost" { 
    auth_token = "************" # 
}

resource "idcloudhost_vm" "app" {
  name = "mahesa-appserver"
  os_name = "ubuntu"
  os_version = "20.04"
  vcpu = 2
  memory = 2048
  disks = 20
  username = "mahesa"
  initial_password = "Mahesa123"
  public_key = "************"
  billing_account_id = "************"
}

resource "idcloudhost_floating_ip" "ipsatu" {
  name = "appserverIP"
  billing_account_id = ************
  assigned_to = idcloudhost_vm.app.id
}
