FROM ubuntu:18.04
# Install Tomcat stage
RUN apt-get -y update 
RUN apt-get -y install default-jdk wget maven
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.69/* /usr/local/tomcat/
RUN pwd
COPY . /boxfuse-sample-java-war-hello
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn -f /boxfuse-sample-java-war-hello/pom.xml package
RUN cd target
RUN cp simple-servlet-0.1.war /var/lib/tomcat9/webapps/
RUN rm -rf /target/*
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
