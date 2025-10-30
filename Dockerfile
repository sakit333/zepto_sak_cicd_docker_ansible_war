#########################################
# Zepto Project — Dockerfile
# Built & Automated by: sak_shetty
#########################################

# ---------- Stage 1: Build with Maven ----------
FROM maven:3.9.4-eclipse-temurin-17 AS build
LABEL maintainer="sak_shetty"
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests


# ---------- Stage 2: Deploy to Tomcat ----------
FROM tomcat:9.0-jdk17-temurin
LABEL author="sak_shetty"
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/*
COPY --from=build /app/target/*.war webapps/ROOT.war
EXPOSE 8084
CMD ["catalina.sh", "run"]
