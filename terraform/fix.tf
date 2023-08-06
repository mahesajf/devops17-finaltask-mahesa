
terraform { 
  required_providers {
    idcloudhost = {
      version = "0.1.0"
      source  = "bapung/idcloudhost" 
    }
  }
}

provider "idcloudhost" { 
    auth_token = "*********" # 
}

resource "idcloudhost_vm" "app" {
  name = "mahesa-appserver"
  os_name = "ubuntu"
  os_version = "20.04"
  vcpu = 2
  memory = 2048
  disks = 20
  username = "mahesa"
  initial_password = "*********"
  public_key = "*********hrcLA9QuINq62MmbN+Trp0gbmXeQHsoB2frdTTdljArwQ7fJCxXKUnKuXXOzjKMGdkIClS8E2R+Gqd0SmfVG+5FTpZHJFSNrrf4Kw0UgzP6i0MBUtDqWr6dScXq1CimMnaepiNG01WqVe6SbQlEkwPnjVX/NvArx0biAfIIYdqF21cBP7z4R6rpaK59N1z+htKUdpR86Rqj9kEd32oJSIGogasjQDg4LS8IlgYtHqRERJL4Fl7Pwvn4QUzTEFK/czZHCC7SV6e0vn3e6JHe2vqcoPyvSm3AlA2hAH0DGiK+tLwtunuDEvLfeqwFD3UQftXjqMbTDKgkDVgElSqFyBR1c6BP3eBMJcwRX+bKmUarXoZCtBTfIW0MFJOThEaCIYklSYSxzyealVACleE7gdWPnzXuIrTHap3t1CbSlN2WV8VjlqswZ4MFlH7CHvQh4SvRIYpdQUzB8= mahesa@DESKTOP-8P2CMLF"
  billing_account_id = "*********"
}

resource "idcloudhost_vm" "monitoring" { # bedakan value sama text "" sama simbol
    name = "mahesa-monitoring"
    os_name = "ubuntu"
    os_version = "20.04"
    vcpu = 2
    memory = 2048
    disks = 20
    username = "mahesa"
    initial_password = "*********"
    billing_account_id = *********
    public_key = "*********h+VemyhQdJNqORBiCcvDSyg47hrcLA9QuINq62MmbN+Trp0gbmXeQHsoB2frdTTdljArwQ7fJCxXKUnKuXXOzjKMGdkIClS8E2R+Gqd0SmfVG+5FTpZHJFSNrrf4Kw0UgzP6i0MBUtDqWr6dScXq1CimMnaepiNG01WqVe6SbQlEkwPnjVX/NvArx0biAfIIYdqF21cBP7z4R6rpaK59N1z+htKUdpR86Rqj9kEd32oJSIGogasjQDg4LS8IlgYtHqRERJL4Fl7Pwvn4QUzTEFK/czZHCC7SV6e0vn3e6JHe2vqcoPyvSm3AlA2hAH0DGiK+tLwtunuDEvLfeqwFD3UQftXjqMbTDKgkDVgElSqFyBR1c6BP3eBMJcwRX+bKmUarXoZCtBTfIW0MFJOThEaCIYklSYSxzyealVACleE7gdWPnzXuIrTHap3t1CbSlN2WV8VjlqswZ4MFlH7CHvQh4SvRIYpdQUzB8= mahesa@DESKTOP-8P2CMLF"
}

resource "idcloudhost_vm" "gate" {
  name = "mahesa-gateway"
  os_name = "ubuntu"
  os_version = "20.04"
  vcpu = 2
  memory = 1024
  disks = 20
  username = "mahesa"
  initial_password = "*********"
  public_key = "*********qORBiCcvDSyg47hrcLA9QuINq62MmbN+Trp0gbmXeQHsoB2frdTTdljArwQ7fJCxXKUnKuXXOzjKMGdkIClS8E2R+Gqd0SmfVG+5FTpZHJFSNrrf4Kw0UgzP6i0MBUtDqWr6dScXq1CimMnaepiNG01WqVe6SbQlEkwPnjVX/NvArx0biAfIIYdqF21cBP7z4R6rpaK59N1z+htKUdpR86Rqj9kEd32oJSIGogasjQDg4LS8IlgYtHqRERJL4Fl7Pwvn4QUzTEFK/czZHCC7SV6e0vn3e6JHe2vqcoPyvSm3AlA2hAH0DGiK+tLwtunuDEvLfeqwFD3UQftXjqMbTDKgkDVgElSqFyBR1c6BP3eBMJcwRX+bKmUarXoZCtBTfIW0MFJOThEaCIYklSYSxzyealVACleE7gdWPnzXuIrTHap3t1CbSlN2WV8VjlqswZ4MFlH7CHvQh4SvRIYpdQUzB8= mahesa@DESKTOP-8P2CMLF"
  billing_account_id = "*********"
}

resource "idcloudhost_floating_ip" "ipdua" {
  name = "gatewayIP"
  billing_account_id = *********
  assigned_to = idcloudhost_vm.gate.id
}

resource "idcloudhost_floating_ip" "ipsatu" {
  name = "appserverIP"
  billing_account_id = *********
  assigned_to = idcloudhost_vm.app.id
}

resource "idcloudhost_floating_ip" "iptiga" { 
  name = "monitoringIP"
  billing_account_id = *********
  assigned_to = idcloudhost_vm.monitoring.id
}
