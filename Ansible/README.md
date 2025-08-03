# ⚙️ Ansible Automation – Install Docker & Deploy Todo App

This directory contains Ansible configurations to automate:

1. Installing **Docker** and **Docker Compose** on Ubuntu-based EC2 instances.
2. Deploying the **Docker Compose** Todo List App to the target servers.

---

## 🚨 Before You Start – Important Notes :

Before running any Ansible playbooks, make sure you have the following setup:

- ✅ You have **Ansible installed** locally (version 2.10+ recommended).  
  If not, install it using:
  ```bash
  sudo apt update && sudo apt install ansible -y
  ```

✅ You have access to the private key (.pem) that matches the key pair used when creating the EC2 instances.
Set permissions:
```bash
chmod 400 path/to/your-key.pem
```

✅ Your EC2 instances must:
- Be running Ubuntu
- Have port 22 open in the security group (for SSH access)
- Be accessible from your local IP
✅ You’ve cloned the full project and kept the .env and docker-compose.yml files ready in the expected local path
✅ You run all commands from the directory that contains the ansible.cfg file

------------------------------------------------------------------------------------------
## 📁 Files Structure

```bash
ansible/
├── ansible.cfg
├── inventory.ini
├── install-docker.yaml
├── deploy-todo-app.yaml
└── README.md
```

🔑 ansible.cfg
------------------
This configuration ensures SSH access to your EC2 instances using the specified PEM file and disables host key checking.

🖥️ inventory.ini
------------------
- webservers: used for installing Docker
- webservers2: used for deploying the app
- 
✅ You can target separate groups or merge them based on your needs.

<img width="981" height="439" alt="Screenshot 2025-07-31 011841" src="https://github.com/user-attachments/assets/65c49440-9903-4516-955d-eabf5ea9a352" />


🔧 install-docker.yaml
----------------------------
This playbook installs Docker, Docker Compose, and adds the user to the docker group. It also:
- Updates the APT cache
- Installs prerequisites
- Adds Docker GPG key & APT repository
- Starts Docker service
- Reboots the server only if user group is modified
🛡️ Uses register and when conditions for intelligent, idempotent execution.

▶️ Run it:
```bash
ansible-playbook install-docker.yaml
```

<img width="963" height="738" alt="Screenshot 2025-07-31 015844" src="https://github.com/user-attachments/assets/501120d0-0153-45ee-94b7-48006779c87c" />


<img width="600" height="148" alt="Screenshot 2025-07-31 015933" src="https://github.com/user-attachments/assets/cbc042c8-bed7-4383-ba5b-3888d84c266f" />



🚀 deploy-todo-app.yaml
-------------------------
This playbook automates deployment of the docker-compose.yml app:
- Creates /home/ubuntu/todo-app/ directory on remote host
- Copies the .env and docker-compose.yml files from your local machine
- Runs docker compose up -d from within that directory
▶️ Run it:
```bash
ansible-playbook deploy-todo-app.yaml
```
✅ No need to SSH manually or upload files yourself — everything is handled by Ansible


<img width="821" height="449" alt="Screenshot 2025-07-31 035349" src="https://github.com/user-attachments/assets/311c8bc5-0dd2-45e3-841f-894e0bbcc897" />


<img width="1003" height="139" alt="Screenshot 2025-07-31 035843" src="https://github.com/user-attachments/assets/f5ae2c19-281d-4f57-a2e4-d24c514cf8fa" />




📝 Notes & Best Practices
----------------------------
- Make sure your SSH key has proper permissions: chmod 400 sallam.pem
- Run Ansible commands from the same directory where ansible.cfg exists
- Make sure your remote EC2 instances allow access from your IP (port 22)
- Your local .env and docker-compose.yml files must exist in the correct path









