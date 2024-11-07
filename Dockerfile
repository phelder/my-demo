FROM maven:3.9.9-ibm-semeru-23-jammy AS build

COPY . .

RUN mvn clean package -DskipTests

FROM openjdk:24-slim-bullseye

COPY --from=build /target/my-demo-0.0.1-SNAPSHOT.jar demo.jar

ENV DB_URL=${DB_URL}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}

EXPOSE 8080

ENTRYPOINT ["java","-jar","demo.jar"]
