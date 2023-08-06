
terraform { 
  required_providers { 
    idcloudhost = {
      version = "0.1.0" 
      source  = "bapung/idcloudhost" 
    }
  }
}

provider "idcloudhost" { 
    auth_token = "************" 
}

resource "idcloudhost_vm" "monitoring" { # bedakan value sama text "" sama simbol
    name = "mahesa-monitoring"
    os_name = "ubuntu"
    os_version = "20.04"
    vcpu = 2
    memory = 2048
    disks = 20
    username = "mahesa"
    initial_password = "Mahesa123"
    billing_account_id = ************
    public_key = "************"
}

resource "idcloudhost_floating_ip" "iptiga" { 
  name = "monitoringIP"
  billing_account_id = ************
  assigned_to = idcloudhost_vm.monitoring.id
}
