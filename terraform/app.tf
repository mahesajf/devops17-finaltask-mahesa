
terraform { 
  required_providers {
    idcloudhost = {
      version = "0.1.0"
      source  = "bapung/idcloudhost" 
    }
  }
}

provider "idcloudhost" { 
    auth_token = "mTWvAHka6YmhUncBxKZyCpeL40C7Kyc0" # 
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDA76Y/Okp4GOSH8/HMWqtaZVmDjRh+VemyhQdJNqORBiCcvDSyg47hrcLA9QuINq62MmbN+Trp0gbmXeQHsoB2frdTTdljArwQ7fJCxXKUnKuXXOzjKMGdkIClS8E2R+Gqd0SmfVG+5FTpZHJFSNrrf4Kw0UgzP6i0MBUtDqWr6dScXq1CimMnaepiNG01WqVe6SbQlEkwPnjVX/NvArx0biAfIIYdqF21cBP7z4R6rpaK59N1z+htKUdpR86Rqj9kEd32oJSIGogasjQDg4LS8IlgYtHqRERJL4Fl7Pwvn4QUzTEFK/czZHCC7SV6e0vn3e6JHe2vqcoPyvSm3AlA2hAH0DGiK+tLwtunuDEvLfeqwFD3UQftXjqMbTDKgkDVgElSqFyBR1c6BP3eBMJcwRX+bKmUarXoZCtBTfIW0MFJOThEaCIYklSYSxzyealVACleE7gdWPnzXuIrTHap3t1CbSlN2WV8VjlqswZ4MFlH7CHvQh4SvRIYpdQUzB8= mahesa@DESKTOP-8P2CMLF"
  billing_account_id = "1200157626"
}

resource "idcloudhost_floating_ip" "ipsatu" {
  name = "appserverIP"
  billing_account_id = 1200157626
  assigned_to = idcloudhost_vm.app.id
}
