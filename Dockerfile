FROM ubuntu:18.04
# Install Tomcat stage
RUN apt-get -y update 
RUN apt-get -y install default-jdk wget maven git
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.69/* /usr/local/tomcat/
RUN echo $PWD
RUN mkdir boxfuse-sample-java-war-hello
RUN echo $PWD
COPY . /boxfuse-sample-java-war-hello
RUN echo $PWD
RUN cd /boxfuse-sample-java-war-hello
RUN echo $PWD
RUN mvn package
RUN echo $PWD
RUN cd target
RUN echo $PWD
RUN cp simple-servlet-0.1.war /var/lib/tomcat9/webapps/
RUN echo $PWD
RUN rm -rf /target/*
RUN echo $PWD
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
