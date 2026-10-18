
FROM tomcat:11-jdk21

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY . /usr/local/tomcat/webapps/ROOT/

RUN sed -i 's/port="8080"/port="10000"/' /usr/local/tomcat/conf/server.xml

EXPOSE 10000

CMD ["catalina.sh", "run"]
