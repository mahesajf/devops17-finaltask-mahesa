# [Click](https://github.com/mahesajf/devops17-finaltask-mahesa/blob/main/1prov/conf.yml)


## Firewal
firewal.yml
```
- become: true
  gather_facts: false
  hosts: gateway
  tasks:
    - name: install firewall
      apt:
        name: ufw
        update_cache: yes
        state: latest
    - name: enable ufw
      community.general.ufw:
        state: enabled
        policy: allow
    - name: rules
      community.general.ufw:
        rule: allow
        proto: tcp
        port: "{{ item }}"
      with_items:
      - 22
      - 80
      - 443
      - 3000
      - 5000
      - 3306
      - 9090
      - 9100
      - 8080
    - name: enable ufw
      community.general.ufw:
        state: reloaded
        policy: allow
		
```
