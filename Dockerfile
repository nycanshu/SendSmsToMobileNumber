# Use an official OpenJDK runtime as a parent image
FROM openjdk:21-jdk-slim

# Set environment variables for security (these will be provided in Render)
ENV TWILIO_ACCOUNT_SID=${TWILIO_ACCOUNT_SID}
ENV TWILIO_AUTH_TOKEN=${TWILIO_AUTH_TOKEN}
ENV TWILIO_PHONE_NUMBER=${TWILIO_PHONE_NUMBER}

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/SendSmsToMobileNumber-0.0.1-SNAPSHOT.jar app.jar

# Expose the application's port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
