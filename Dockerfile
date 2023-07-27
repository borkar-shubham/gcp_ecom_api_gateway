FROM maven:latest AS image_builder
WORKDIR /app
COPY . .
RUN mvn clean package install

#jdk
FROM openjdk:11.0.10-jre
WORKDIR /app
COPY --from=image_builder /app/target/zuul-0.0.1-SNAPSHOT.jar /app 
EXPOSE 9999
CMD ["java", "-jar", "zuul-0.0.1-SNAPSHOT.jar"] 
