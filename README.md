# 🚀 Zepto Project — Cloud CI/CD Edition  
**Developed by: 👨‍💻 sak_shetty**  
**CI/CD Pipeline Designed by: 🔧 sak_shetty**

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
Developer → GitHub → Jenkins → Maven Build → Docker Build & Push → 
Ansible → Target EC2 → Pull Latest Image → Deploy Container
```
---
*Designed and Developed by @sak_shetty*