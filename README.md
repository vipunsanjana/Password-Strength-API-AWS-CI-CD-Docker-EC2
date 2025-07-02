# 🔐 Password Strength Analyzer API

A FastAPI-based microservice that analyzes password strength using `zxcvbn` and checks for data breaches via the HaveIBeenPwned API.  


---

## 🚀 Features

- Password strength scoring (0–4)
- Detailed feedback with weaknesses and suggestions
- Data breach check via k-anonymity hashing model (SHA-1)
- Fully async + Dockerized + lightweight

---

## 📂 Project Structure

- password_strength_api/
- ├── app/
- │ ├── init.py
-│ ├── main.py
- │ ├── schemas.py
- │ ├── utils.py
- ├── requirements.txt
- ├── Dockerfile
- ├── .gitignore
- ├── .dockerignore
- └── README.md

---

## 🧪 Example Usage

### ▶️ Request

- `POST /analyze`

- ```json
- {
-  "password": "myp@ssword123"
- }


### ▶️ Response
- {
-  "score": 2,
-  "weaknesses": ["This is a top-10 common password"],
-  "suggestions": ["Use a few words, avoid common phrases"],
-  "breached": true
- }
