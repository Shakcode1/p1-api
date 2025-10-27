# Use a lightweight Python image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files to /app
COPY . .

# Install Flask
RUN pip install flask

# Expose port 5000 (the Flask app port)
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
