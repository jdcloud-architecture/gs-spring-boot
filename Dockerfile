FROM jdcloud-demo-cn-north-1.jcr.service.jdcloud.com/library/centos-java
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]