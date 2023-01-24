FROM tomcat:8.0.20-jre8

COPY target/java-maven-app-1.1.0-SNAPSHOT.jar  /usr/local/tomcat/webapps/java-web-app.var


