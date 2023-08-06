# Terraform

code : 

Install terraform : [documentasi](https://developer.hashicorp.com/terraform/downloads)

// untuk resource IDCH opsional dipisahkan

Spec nya sesuai selera masing-masing

```

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

```

terraform init
terraform plan
terraform apply

# Ansible
Install ansible : [documentasi](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
ansible.cfg :
```
[defaults]
inventory = Inventory
private_key_file = ~/.ssh/id_rsa
host_key_checking = false
interpreter_python = auto_silent
```

Inventory

```
[appserver]
103.191.92.108

[gateway]
103.174.114.60

[monitoring]
103.176.79.213

[all:vars]
ansible_user=mahesa
```

ansible-playbook [conf.yml](https://github.com/mahesajf/devops17-finaltask-mahesa/blob/main/1prov/conf.yml) [dock-ne.yml](https://github.com/mahesajf/devops17-finaltask-mahesa/blob/main/1prov/dock-ne.yml) [moni.yml](https://github.com/mahesajf/devops17-finaltask-mahesa/blob/main/1prov/moni.yml) [nginx.yml](https://github.com/mahesajf/devops17-finaltask-mahesa/blob/main/1prov/nginx.yml)

-check semua domain
-scrape config grafana

```
scrape_configs:
  - job_name: node-dumbways
    scrape_interval: 5s
    static_configs:
      - targets:
        - node-app.mahesa.studentdumbways.my.id
        - node-gate.mahesa.studentdumbways.my.id
        - node-moni.mahesa.studentdumbways.my.id
```



