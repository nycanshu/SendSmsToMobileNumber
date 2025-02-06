# Use an official OpenJDK runtime as a builder
FROM maven:3.9.6-eclipse-temurin-21 AS builder

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use a lightweight OpenJDK image for running the application
FROM openjdk:21-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/SendSmsToMobileNumber-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
