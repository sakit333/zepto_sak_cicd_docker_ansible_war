# 🚀 Zepto Project — Cloud CI/CD Edition  
**Developed and CI/CD Pipeline Designed by: 👨‍💻 sak_shetty**  

This project showcases a full-stack web application deployed using a complete **DevOps CI/CD pipeline** on AWS infrastructure.  
It includes automation for building, testing, containerizing, and deploying the application using industry-standard tools.

---

## 🏗️ Architecture Overview

| Layer | Tool | Purpose |
|-------|------|--------|
| Cloud | AWS EC2 | Hosting Jenkins, Ansible & Deployment Server |
| SCM | GitHub | Source Code Version Control |
| CI | Jenkins | Automates Build + Test Pipeline |
| Build Tool | Maven | Build & Package Application |
| App Server | Apache Tomcat | Deploy & Run Web App |
| Containerization | Docker | Image creation & container deployment |
| Configuration Mgmt | Ansible | Automate deployment configuration |
| Deployment Model | CI/CD | Automated build & continuous deployment |

---

## ⚙️ CI/CD Workflow
```mathematica
Developer → GitHub → Jenkins → Maven Build → Docker Build & Push → Ansible → Target EC2 → Pull Latest Image → Deploy Container
```
## Project Photos

<img width="1890" height="922" alt="image" src="https://github.com/user-attachments/assets/03bde194-db37-41f4-93bb-a1eca75fb2bc" />

<img width="1887" height="918" alt="image" src="https://github.com/user-attachments/assets/bca989e8-18ec-4278-b665-7c8895932fbe" />

<img width="1882" height="787" alt="image" src="https://github.com/user-attachments/assets/9d730f1a-e327-433f-8f97-6b5b9e3b6edf" />

<img width="1903" height="916" alt="image" src="https://github.com/user-attachments/assets/5077a325-5945-4280-8d95-aecc30d42d1c" />

---
### Project Instructions:

1. Jenkins
    - add **Stage View** Plugin
    - add **Jenkins Credentials** for DockerHub
2. Master Node
    - Provide **jenkens** user permission
    - Install **Docker**
3. Worker Node
    - Install **Docker**

---
*Designed and Developed by @sak_shetty*
