# Use official lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies (for zxcvbn native deps)
RUN apt-get update && apt-get install -y build-essential

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Expose port
EXPOSE 8000

# Start FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
