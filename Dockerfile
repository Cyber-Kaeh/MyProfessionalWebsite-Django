# Use the official Python image from the Docker Hub with Alpine Linux
FROM python:3.13.2-alpine3.21

# Expose port 8000
EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apk update && apk add --no-cache \
    build-base \
    libpq-dev \
    postgresql-dev \
    gcc \
    musl-dev \
    linux-headers \
    nodejs \
    npm

# Install pip requirements
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Install vue-cli
RUN npm install -g @vue/cli

# Set working directory
WORKDIR /app

# Copy project files to the working directory
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "testproject.wsgi"]
