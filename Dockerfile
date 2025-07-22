# Use official Python image
FROM python:3.10-slim

# Environment vars
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work dir
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . /app/

# Run Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
