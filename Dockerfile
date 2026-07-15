# Use Java 17 runtime
FROM eclipse-temurin:17-jdk

# Create application directory
WORKDIR /app

# Copy jar file
COPY target/*.jar app.jar

# Expose Spring Boot port
EXPOSE 8090

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]
