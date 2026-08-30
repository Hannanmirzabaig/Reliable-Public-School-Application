# Stage 1: Build WAR using Maven
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Run WAR on Tomcat
FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/ReliablePublicSchool.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]