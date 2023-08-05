# Use an official Java runtime as a parent image
FROM openjdk:8-jdk-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the dist/HSonline.war file from the build stage to the container
COPY dist/HSonline.war /app

# Expose the port that the application will listen on
EXPOSE 8080

# Start the application
CMD ["java", "-jar", "HSonline.war"]
