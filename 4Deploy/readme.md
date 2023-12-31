# Deployment
## Clone & Add Remote
Ansible:
```
---
- name: Clone fe-dumbmerch and be-dumbmerch Repositories and Add Remotes
  hosts: appserver
  tasks:
    - name: Clone fe-dumbmerch repository
      git:
        repo: https://github.com/demo-dumbways/fe-dumbmerch.git
        dest: /home/mahesa/fe-dumbmerch

    - name: Add remote "upstream" for fe-dumbmerch
      command: git remote add upstream https://github.com/demo-dumbways/fe-dumbmerch.git
      args:
        chdir: /home/mahesa/fe-dumbmerch

    - name: Clone be-dumbmerch repository
      git:
        repo: https://github.com/demo-dumbways/be-dumbmerch.git
        dest: /home/mahesa/be-dumbmerch

    - name: Add remote "upstream" for be-dumbmerch
      command: git remote add upstream https://github.com/demo-dumbways/be-dumbmerch.git
      args:
        chdir: /home/mahesa/be-dumbmerch
```


Dockerfile di backend
docker build -t mahesa/be-dumbmerch:latest .
```
FROM golang:1.16
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go get -x ./ && go build && go mod download
EXPOSE 5000
CMD ["go", "run", "main.go"]
```

Dockerfile di frontend
docker build -t mahesa/fe-dumbmerch:latest 
```
FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000
CMD ["yarn", "start"]
```


Didalam appserver docker-compose.yml
docker-compose up -d
```
version: "3.8"
services:
   db:
    image: postgres:latest
    container_name: db-dumbmerch
    ports:
      - 5432:5432
    volumes:
      - ~/postgresql:/var/lib/postgresql/data
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=postgres
   backend:
    depends_on:
      - db
    image: mahesa/be-dumbmerch:latest
    container_name: be-dumbmerch
    stdin_open: true
    restart: unless-stopped
    ports:
      - 5000:5000
   frontend:
    image: mahesa/fe-dumbmerch:latest
    container_name: fe-dumbmerch
    stdin_open: true
    restart: unless-stopped
    ports:
      - 3000:3000
```

# CI/CD Jenkins

<br>

```
def branch = "production"
def repo = "git@github.com:mahesajf/be-dumbmerch.git"
def cred = "jenkins"
def dir = "~/be-dumbmerch"
def server = "mahesajihanfadhlurrahman@34.142.157.248"
def imagename = "be-dumbmerch"
def dockerusername = "mahesaj"

pipeline {
    agent any

    stages {
        stage('Repository pull') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                        cd ${dir}
                        git remote add origin ${repo} || git remote set-url origin ${repo}
                        git pull origin ${branch}
                        exit
                    EOF
                    """
                }
            }
        }

        stage('Image build') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                        cd ${dir}
                        docker build -t ${imagename}:latest .
                        exit
                    EOF
                    """
                }
            }
        }

        stage('Running the image in a container') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                        cd ${dir}
                        docker container stop ${imagename} || true
                        docker container rm ${imagename} || true
                        docker run -d -p 5001:5000 --name="${imagename}"  ${imagename}:latest
                        exit
                    EOF
                    """
                }
            }
        }

        stage('Image push') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                        docker tag ${imagename}:latest ${dockerusername}/${imagename}:latest
                        docker image push ${dockerusername}/${imagename}:latest
                        exit
                    EOF
                    """
                }
            }
        }
    }
}

```
