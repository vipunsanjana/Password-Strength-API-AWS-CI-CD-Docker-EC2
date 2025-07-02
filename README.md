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
| Docker | A platform designed to help developers build, share, and run container applications. |
| AWS | Amazon Web Services is a subsidiary of Amazon providing on-demand cloud computing platforms and APIs to individuals, companies, and governments, on a metered pay-as-you-go basis. |
| EC2 | Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. |
| CISD | Center for Internet Security (CIS) provides benchmarks and best practices for securing systems and data. |

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
