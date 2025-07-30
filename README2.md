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
  - Private Docker Registry (my docker hub Registry)

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
```
2. Set up Environment Variables
Create a .env file and add your MongoDB URL:
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

<img width="1275" height="408" alt="Screenshot 2025-07-30 063528" src="https://github.com/user-attachments/assets/d2fa2813-6d86-46c6-be9f-135942a4648f" />

<img width="1622" height="617" alt="Screenshot 2025-07-30 063650" src="https://github.com/user-attachments/assets/faf7ffdc-0e69-4b6c-9603-8e0d158411e0" />


👤 Author
Mahmoud Osama Sallam
DevOps & System Engineer Trainee
