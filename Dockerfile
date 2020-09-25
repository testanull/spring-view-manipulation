FROM maven:3.5.2-jdk-8 AS maven_build
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
FROM openjdk:8-jdk-alpine
EXPOSE 8090
ENV flag '{flag_here}'
CMD java -jar /data/java-spring-thymeleaf-1.0.jar
COPY --from=maven_build /tmp/target/java-spring-thymeleaf-1.0.jar /data/java-spring-thymeleaf-1.0.jar
