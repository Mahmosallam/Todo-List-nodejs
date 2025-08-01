
📌 DevOps Project – Todo List App Deployment

👋 Introduction
This project is part of a DevOps assessment. The goal is to containerize a Node.js TODO application, automate its deployment using CI/CD tools, and run it on an AWS EC2 instance with monitoring and auto-update features.
I have completed Parts 1 to 3 of the task (excluding the optional Kubernetes part), and this README documents the full process.


![chrome_VMgyYeQr3l](https://github.com/user-attachments/assets/94cc91b4-6bd5-4189-a105-c9e1cf79dea9)



---------------------------------------------------
🛠️ Tech Stack
- Node.js – Todo list application
- MongoDB – Database
- Docker & Docker Compose – Containerization & orchestration
- GitHub Actions – CI pipeline
- Terraform – Infrastructure provisioning on AWS
- Ansible – Configuration management
- Watchtower – Auto-update containers
- AWS EC2 – Hosting the app

-----------------------------------------------------------
🔧 Requirements
- AWS Account (Free Tier)
- GitHub account
- Docker Hub or private Docker registry
- Terraform installed locally
- Ansible installed locally
- SSH key pair for EC2 access

---------------------------------------------------------------
🚀 Project Flow
✅ Part 1 – Dockerize & CI with GitHub Actions
1- Cloned the repo: https://github.com/Ankit6098/Todo-List-nodejs
```bash
git clone https://github.com/Ankit6098/Todo-List-nodejs.git
cd Todo-List-nodejs
```
2- Updated .env with my MongoDB connection.
```bash
mongoDbUrl=mongodb+srv://<username>:<password>@cluster0.abcde.mongodb.net/
```
<img width="812" height="61" alt="Screenshot 2025-07-30 055001" src="https://github.com/user-attachments/assets/3d4d14e7-11bf-4651-99b3-b0dcc304426e" />


<img width="1606" height="246" alt="image" src="https://github.com/user-attachments/assets/4fc898ac-3464-4a38-99c3-79b73bd5e3de" />

3. Install Dependencies
```bash
npm install
```
4. Run the App Locally (Dev Mode)
```bash
npm start
```

<img width="764" height="297" alt="Screenshot 2025-07-30 054932" src="https://github.com/user-attachments/assets/fc3f1c88-f40c-4670-b200-221cae9c05fd" />


🐳 Docker Support
1. Build Docker Image
```bash
docker build -t todo-list-nodejs .
```
3. Run Container
```bash
docker run -p 8080:4000 --env-file .env todo-list-nodejs
Access it at: http://localhost:8080
```

<img width="771" height="270" alt="Screenshot 2025-07-30 060612" src="https://github.com/user-attachments/assets/6dcc2b7f-5d18-4c72-9072-ac76b1647bc1" />


<img width="1536" height="861" alt="Screenshot 2025-07-30 060627" src="https://github.com/user-attachments/assets/14c94a3b-d319-4872-a22d-f417d4cadd19" />


🤖 GitHub Actions CI/CD
GitHub Actions is used to automate:
-Building Docker image on push
-Logging into Docker Hub Registry (ACR)
-Pushing the image to ACR

CI Workflow Summary:
-Trigger: On push to main
-Steps:
  -Checkout code
  -Login to Docker ACR
  -Build image
  -Push image

You can find the workflow in:
.github/workflows/docker-build.yml

 Docker working

 CI/CD with GitHub Actions successful
 Pushed to Private Docker Registry

<img width="980" height="623" alt="Screenshot 2025-07-30 063333" src="https://github.com/user-attachments/assets/8804055b-19e1-4a7a-a71d-80775532a5e2" />

-----------------------------------------------------------------
✅ Part 2 – Provision EC2 with Terraform & Configure with Ansible
- Wrote a Terraform script to:
    - Create an EC2 instance
    - Create a security group
    - Upload SSH key
      
[Go to Terraform documentation →](https://github.com/Mahmosallam/Todo-List-nodejs/tree/master/Terraform)

- Used Ansible to:
    - Connect to the EC2 via SSH
    - Install Docker
    - Add the EC2 user to the docker group
    - Copy .env and docker-compose.yml to the EC2
    - Run Docker Compose to launch the app

  [Go to Ansible documentation →](https://github.com/Mahmosallam/Todo-List-nodejs/tree/master/Ansible)

----------------------------------------------------------------------
---

### ✅ Part 3 – Docker Compose Deployment & Auto Updates with Watchtower

Once Docker and Docker Compose are installed on the EC2 instances, I deployed the Node.js Todo List App using `docker-compose`.

I created a `docker-compose.yml` file that includes:

- The **todo-app** container (Node.js app)
- A **MongoDB** service as a database
- A **Watchtower** service to handle auto-updates

#### 🔍 Health Checks
Each service includes a health check to ensure it's running properly and restarts if it becomes unhealthy.

#### 🛠 Deployment with Ansible
To automate the deployment, I created a dedicated Ansible playbook:
- Copies `.env` and `docker-compose.yml` to `/home/ubuntu/todo-app/` on the EC2
- Runs `docker compose up -d` remotely to launch the containers

This allows me to deploy the entire stack using a single command:
```bash
ansible-playbook deploy-todo-app.yaml
```


🔄 Auto-Update with Watchtower
----------------------------------
I included Watchtower in the docker-compose.yml to:
- Monitor the Docker registry for updated images
- Pull the new version automatically
- Restart the app container with no manual work
This ensures that whenever I push a new image, the app updates itself in production

-------------------------------------------------------------------------------
#### 🤔 Why I Chose Watchtower

I chose **Watchtower** for the auto-update mechanism because:

- ✅ It's extremely lightweight and easy to set up inside a `docker-compose` stack
- ✅ It requires **no external tools** or complex configuration
- ✅ It runs as a container itself and uses the Docker socket to monitor running containers
- ✅ It automatically checks for updated images and restarts only the affected containers
- ✅ It's ideal for small to medium deployments where simplicity and automation are key

Overall, Watchtower was the perfect choice for this project to implement continuous delivery with minimal overhead.

-----------------------------------------------------------------------------------
🧪 CI/CD Test Example
------------------------
To test the auto-update mechanism:
- we can see here the original app

<img width="1582" height="851" alt="Screenshot 2025-07-31 041210" src="https://github.com/user-attachments/assets/cf5f6266-bd6c-42d5-985c-95d4a2928b01" />


- and the image running 32 minuite ago

  <img width="1003" height="266" alt="Screenshot 2025-07-31 050836" src="https://github.com/user-attachments/assets/77495056-a76d-40d9-9cb5-89d67a63b9fb" />


- I made a small change in the app
- Pushed it to GitHub
- GitHub Actions rebuilt the image and pushed it to the registry
- Watchtower pulled the new image and restarted the app container
✅ The new version was up and running within seconds — fully automated.

we can see the play workflow is run again

<img width="1344" height="572" alt="Screenshot 2025-07-31 051033" src="https://github.com/user-attachments/assets/9f50b7be-7fc7-4d61-b158-f1d85e427ba3" />


and githupaction push it to the repo 

<img width="974" height="173" alt="Screenshot 2025-07-31 051040" src="https://github.com/user-attachments/assets/b16e7cfb-8acb-4d23-9310-75a0e5fcc77c" />


and Watchtower pulled the new image and restarted the app container

<img width="967" height="240" alt="Screenshot 2025-07-31 051316" src="https://github.com/user-attachments/assets/ff239c7e-e344-4e86-adba-073f87b5d76b" />


and here is the new app

<img width="1586" height="708" alt="Screenshot 2025-07-31 051412" src="https://github.com/user-attachments/assets/6d37728d-d16a-4108-998c-fea77bb0607d" />


---

## 🙌 Final Notes

This project was an amazing opportunity to apply real-world DevOps practices end to end — from infrastructure as code with Terraform, to automation with Ansible, containerization with Docker, and continuous integration & delivery with GitHub Actions and Watchtower.

🚀 I'm planning to continue working on this project by:
- Adding a **Load Balancer (e.g., AWS ALB)** for better scalability
- Learning and integrating **ArgoCD** to implement GitOps-based continuous delivery

Thank you for taking the time to review my project. I really enjoyed building it 

---

## 📬 Contact

Feel free to reach out if you have any feedback or questions!

- **GitHub:** [github.com/sallam](https://github.com/Mahmosallam)
- **LinkedIn:** [linkedin.com/in/mahmoudsallam](https://www.linkedin.com/in/mahmoud-sallam-a9b3b01ba)
- **Email:** mahmoudosamasallam@gmail.com


















