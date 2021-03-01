FROM maven:3.6-jdk-13-alpine AS maven_builder

COPY school-be/pom.xml /build/
COPY school-be/src /build/src/

WORKDIR /build/
RUN mvn package

FROM adoptopenjdk/openjdk11:alpine-jre

WORKDIR /app

COPY --from=maven_builder /build/target/schoolbe-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT [ "java", "-jar", "schoolbe-0.0.1-SNAPSHOT.jar" ]