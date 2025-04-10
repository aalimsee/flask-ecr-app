


# Use the official Python image from Docker Hub
FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies
# "--no-cache-dir" used to prevent pip from storing downloaded packages in cache during install
# where requirements.txt consist of Flask==2.3.3
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
# It tells Flask which file to run when you use the "flask run" command
ENV FLASK_APP=app.py

# Run the Flask app. flask run: Runs your Flask app using the built-in development server
# CMD ["python", "app.py"]
CMD ["flask", "run", "--host=0.0.0.0"]

