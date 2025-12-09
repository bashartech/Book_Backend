# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies without caching
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app code
COPY . .

# Expose the port your app will run on
EXPOSE 8080

# Command to run your app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
