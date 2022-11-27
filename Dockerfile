FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get -y install default-jdk wget maven
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.68/* /usr/local/tomcat/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]