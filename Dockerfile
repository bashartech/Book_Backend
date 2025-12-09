# Use official Python base image
FROM python:3.11-slim

# Set a working directory inside the container
WORKDIR /uvproject

# Create a non-root user for security
RUN useradd -m uvuser
USER uvuser

# Copy only necessary files first to leverage Docker cache
COPY --chown=uvuser:uvuser requirements.txt .

# Install Python dependencies without cache to save space
RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project files
COPY --chown=uvuser:uvuser main.py .

# Expose the port your FastAPI app will run on
EXPOSE 8080

# Command to run the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
