FROM centos:7
MAINTAINER saifcse05@gmail.com
RUN yum update -y
RUN yum install -y curl
RUN yum install -y wget
RUN yum install -y vi
RUN yum install -y zip
RUN yum install -y unzip
RUN yum install -y java-1.8.0-openjdk
ENV JAVA_HOME /usr
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
ADD https://supportresources.revesoft.com:4430/media/Tools/Web%20Server/jakarta-tomcat-7.0.61.zip /usr/local/tomcat/
RUN unzip jakarta-tomcat-7.0.61.zip
RUN mv jakarta-tomcat-7.0.61/* /usr/local/tomcat/.
RUN mkdir /usr/local/tomcat/webapps/reve/
WorkDIR /usr/local/tomcat/webapps/reve/
COPY index.html .
EXPOSE 80
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
