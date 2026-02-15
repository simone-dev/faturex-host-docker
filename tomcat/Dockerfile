FROM tomcat:9.0-jre8

# 2. Create a non-privileged user
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat

# 3. Secure the configuration
# - Disable the shutdown port (-1)
# - Remove server banner/version info
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/' /usr/local/tomcat/conf/server.xml

ADD setenv.sh /usr/local/tomcat/bin/setenv.sh

RUN apt-get update && apt-get install -y --no-install-recommends \
    fontconfig \
    ttf-mscorefonts-installer && \
    fc-cache -f && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/apk && chown tomcat:tomcat /opt/apk
RUN chown tomcat:tomcat /usr/local/tomcat/logs
RUN chown tomcat:tomcat /opt/tomcat/logs
USER tomcat
 
EXPOSE 8080
CMD ["catalina.sh", "run"]
