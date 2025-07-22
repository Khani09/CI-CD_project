#  Use and official python image
FROM python:3.10-slim

# Set enviroment variables to prevent Python from writing .pyc files and enable unbuffered logs
ENV PYTHNDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set working directory inside container
WORKDIR /app

# Copy dependancy list
COPY requirements.txt /app/requirements.txt

# Install dependancy
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the entire project into container
COPY . /app/

# Run Run the development server (for production, use gunicorn)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
