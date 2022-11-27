FROM ubuntu:18.04
RUN apt-get -y update 
RUN apt-get -y install default-jdk wget maven git
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.69/* /usr/local/tomcat/
WORKDIR /boxfuse-sample-java-war-hello
COPY . .
RUN mvn package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
RUN rm -rf /boxfuse-sample-java-war-hello/target/*
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
