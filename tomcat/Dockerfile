FROM tomcat:9.0-jre8

# 2. Create a non-privileged user
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat

# 3. Secure the configuration
# - Disable the shutdown port (-1)
# - Remove server banner/version info
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/' /usr/local/tomcat/conf/server.xml

ADD setenv.sh /usr/local/tomcat/bin/setenv.sh


RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f


USER tomcat
RUN mkdir -p /opt/apk 
EXPOSE 8080
CMD ["catalina.sh", "run"]
