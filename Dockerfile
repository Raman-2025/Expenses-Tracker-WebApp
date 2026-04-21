# stage 1 build jar [java development runtime ] using maven
FROM maven:3.9.9-eclipse-temurin-17-alpine AS builder 

WORKDIR /app

COPY . .

RUN mvn clean install  -DskipTests=true

# stage 2 excute jar file  from above stage

FROM eclipse-temurin:17-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar  /app/expenseapp

EXPOSE 8080

CMD ["java","-jar","/app/target/expenseapp.jar"]
