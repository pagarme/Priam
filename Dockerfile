FROM openjdk:8 as builder
ADD . .
RUN ./gradlew war --stacktrace

FROM tomcat:8.0-jre8 as runner
WORKDIR /usr/local/tomcat/webapps
COPY --from=builder ./priam-web/build/libs/priam-*.war .
