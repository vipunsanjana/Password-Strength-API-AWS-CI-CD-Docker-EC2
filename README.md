# Password Strength Analyzer API

A FastAPI-based microservice that analyzes password strength using zxcvbn and checks for data breaches via the HaveIBeenPwned API.

## 🚀 Features

| Feature | Description |
|---------|-------------|
| Password strength scoring (0–4) | Provides a numerical score indicating password robustness. |
| Detailed feedback | Offers specific weaknesses identified and actionable suggestions for improvement. |
| Data breach check | Integrates with the HaveIBeenPwned API using a k-anonymity hashing model (SHA-1) for privacy-preserving breach detection. |
| Fully async | Built with asynchronous operations for high performance. |
| Dockerized | Easily deployable via Docker containers. |
| Lightweight | Designed for minimal resource consumption. |

## 🛠 Technologies Used

| Technology | Description |
|------------|-------------|
| FastAPI | A modern, fast (high-performance) web framework for building APIs with Python 3.6+ based on standard Python type hints. |
| Docker | A platform for developing, shipping, and running applications in containers. |
| AWS | Amazon Web Services, a comprehensive and broadly adopted cloud platform. |
| EC2 | Amazon Elastic Compute Cloud, a web service that provides secure, resizable compute capacity in the cloud. |
| CI/CD | Continuous Integration and Continuous Deployment, a method to frequently deliver apps to customers by introducing automation into the stages of app development. |

## 📂 Project Structure

| Path |
|------|
| password_strength_api/ | |
| ├── app/ | |
| │ ├── __init__.py | |
| │ ├── main.py | |
| │ ├── schemas.py | |
| │ └── utils.py | |
| ├── requirements.txt | |
| ├── Dockerfile | |
| ├── buildspec.yml | |
| ├── appspec.yml | |
| ├── .gitignore | |
| ├── scripts/ | |
| │ ├── start_container.sh | |
| │ └── stop_container.sh | |
| ├── .dockerignore | |
| └── README.md | |

## 🧪 Example Usage

### ▶️ Request

**Endpoint:** `POST /analyze`

```json
{
  "password": "myp@ssword123"
}
