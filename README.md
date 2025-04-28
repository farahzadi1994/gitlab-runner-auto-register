# 🚀 GitLab & GitLab Runner - Full Auto Deployment & Registration

A fully automated setup to deploy **GitLab Community Edition** and **GitLab Runner** using Docker Compose,  
and **programmatically register runners** through GitLab API using Authentication Tokens.

---

## 🔥 Features

- One-click deployment of GitLab CE and GitLab Runner via Docker Compose
- Automatic creation of Personal Access Token (PAT) for runner registration
- Secure registration of GitLab Runner without using old Registration Tokens
- Internal communication between services using Docker Networking
- Clean and production-ready project structure
- Ready to be extended for Kubernetes and advanced CI/CD

---

## 📦 Project Structure

```bash
gitlab-runner-auto-register/
├── docker-compose.yml      # Docker services definitions
├── .env                     # Configuration variables
├── scripts/
│   ├── create_pat.sh         # Script to generate PAT
│   ├── get_runner_token.sh   # Script to get Runner Auth Token
│   └── register_runner.sh    # Script to auto-register Runner
└── README.md                 # Project Documentation
```

---

## 🛠 How It Works

1. Deploy GitLab CE and GitLab Runner containers.
2. Create a **Personal Access Token (PAT)** for the `root` user.
3. Retrieve an **Authentication Token** for the Runner via GitLab API.
4. Auto-register the Runner using the obtained Authentication Token.

---

## ⚡ Quick Start Guide

1. Clone the repository:

```bash
git clone https://github.com/farahzadi1994/gitlab-runner-auto-register.git
cd gitlab-runner-auto-register
```

2. Update `.env` variables as needed.

3. Start services:

```bash
docker-compose up -d
```

4. Run setup scripts:

```bash
bash scripts/create_pat.sh
bash scripts/get_runner_token.sh
```

> The GitLab Runner will auto-register itself after the GitLab service becomes available.

---

## 🌍 Demo Environment

| Service        | URL                     |
|----------------|--------------------------|
| GitLab Web     | http://localhost:8080     |
| SSH Access     | localhost:2222            |

---

## 📜 License

This project is licensed under the **MIT License**.

---

## 🤝 Contributions

Contributions are welcome! Feel free to:
- Fork the project
- Submit pull requests
- Open issues for ideas or bug reports

---

# 🌟 Let's automate everything, the DevOps way!
