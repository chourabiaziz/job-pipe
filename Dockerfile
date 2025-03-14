# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Expose the port the app runs on
EXPOSE 8082

# Copy the built JAR file from the target directory into the container
# Make sure the JAR file exists in the target directory (you should run `mvn clean package` first)
COPY target/kaddem-1.0.jar /app/kaddem.jar

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/kaddem.jar"]
