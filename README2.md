# 📝 Todo List Node.js App - 

This project is part of a DevOps Internship assessment. It demonstrates deploying a full-stack Node.js Todo application using modern DevOps tools like Docker, GitHub Actions, and private Docker Registry.

---

## 📁 Project Overview

- **App**: Todo List Web Application  
- **Tech Stack**:
  - Node.js
  - Express
  - MongoDB (MongoDB Atlas)
- **DevOps Tools**:
  - Docker
  - GitHub Actions (CI/CD)
  - Private Docker Registry (Azure Container Registry)

---

## 🚀 Objectives

✅ Clone the repository  
✅ Use a personal MongoDB Atlas database  
✅ Dockerize the application  
✅ Set up GitHub Actions to:
  - Build the Docker image
  - Push it to a private registry

---

## 🛠️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Ankit6098/Todo-List-nodejs.git
cd Todo-List-nodejs
2. Set up Environment Variables
Create a .env file and add your MongoDB URL:

env
Copy
Edit
mongoDbUrl=mongodb+srv://<username>:<password>@cluster0.abcde.mongodb.net/
3. Install Dependencies
bash
Copy
Edit
npm install
4. Run the App Locally (Dev Mode)
bash
Copy
Edit
npm start
🐳 Docker Support
1. Build Docker Image
bash
Copy
Edit
docker build -t todo-list-nodejs .
2. Run Container
bash
Copy
Edit
docker run -p 8080:4000 --env-file .env todo-list-nodejs
Access it at: http://localhost:8080

🤖 GitHub Actions CI/CD
GitHub Actions is used to automate:

Building Docker image on push

Logging into Azure Container Registry (ACR)

Pushing the image to ACR

CI Workflow Summary:
Trigger: On push to main

Steps:

Checkout code

Login to Docker ACR

Build image

Push image

You can find the workflow in:
.github/workflows/docker-build.yml

🔒 Azure Container Registry
Registry Used: githubactionsiti2025.azurecr.io

Docker Image Format:

bash
Copy
Edit
githubactionsiti2025.azurecr.io/githubactionsiti2025/nginx-sallam:sallam
✅ Status
 MongoDB integrated

 Docker working

 CI/CD with GitHub Actions successful

 Pushed to Private Docker Registry

📸 Screenshots
Add screenshots of app running, Docker dashboard, and GitHub Action run if needed.

👤 Author
Mahmoud Osama Sallam
DevOps & System Engineer Trainee
