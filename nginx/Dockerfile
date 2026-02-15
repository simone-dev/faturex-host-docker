# Use the official Nginx base image
FROM nginx:alpine

# 1. Standard web root setup
# Note: In your compose, you are mounting nginx.conf as a volume.
# This COPY is a good "fallback" for the image itself.
COPY nginx.conf /etc/nginx/nginx.conf

# 2. Copy static assets
# Ensure these files exist in your ./nginx folder relative to the Dockerfile
COPY index.html /usr/share/nginx/html/index.html
COPY ./images /usr/share/nginx/html/images

# 3. Expose both HTTP and HTTPS ports 
# This matches your docker-compose.yml ports: "80:80" and "443:443"
EXPOSE 80
EXPOSE 443

# 4. Permissions Fix
# Ensure the nginx user can read the static files
RUN chmod -R 755 /usr/share/nginx/html

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]