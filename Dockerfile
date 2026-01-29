FROM python:3.11-slim

# Set environment variables for Python optimization
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Install dependencies: first copy requirements.txt and install
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the Django project code into the container
COPY . /app/

# Expose port 8000 for the application
EXPOSE 8000

# Command to run the Django development server when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]