FROM tomcat:9.0-jre8

# 1. Create a non-privileged user with a fixed UID/GID
# Using a specific UID (e.g., 1001) helps match host permissions if needed
RUN groupadd -g 1001 tomcat && \
    useradd -u 1001 -r -g tomcat -s /sbin/nologin tomcat

# 2. Secure the configuration
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/' /usr/local/tomcat/conf/server.xml

# 3. Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    fontconfig \
    ttf-mscorefonts-installer && \
    fc-cache -f && \
    rm -rf /var/lib/apt/lists/*

# 4. Create directories and set ownership BEFORE switching users
# We consolidate these to keep the image layers clean
RUN mkdir -p /opt/apk /opt/tomcat/logs /usr/local/tomcat/logs /usr/local/tomcat/work /usr/local/tomcat/temp && \
    chown -R tomcat:tomcat /usr/local/tomcat /opt/apk /opt/tomcat/logs

ADD --chown=tomcat:tomcat setenv.sh /usr/local/tomcat/bin/setenv.sh
RUN chmod +x /usr/local/tomcat/bin/setenv.sh

# 5. Final Permission Check
# Note: chmod 777 is usually overkill; 755 is safer once chown is correct.
RUN chmod -R 755 /usr/local/tomcat/logs /opt/tomcat/logs /opt/apk

USER tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]