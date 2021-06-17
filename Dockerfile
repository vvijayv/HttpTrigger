# Maven build container 

FROM maven:3.6.3-openjdk-11 AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package

#pull base image

FROM openjdk

EXPOSE 8080

COPY --from=maven_build /tmp/target/hello-world-0.1.0.jar /app/hello-world-0.1.0.jar

#default command
CMD java -jar /app/hello-world-0.1.0.jar
