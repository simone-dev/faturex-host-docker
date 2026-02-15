# Use the official Nginx base image
FROM nginx:alpine

# Copy the custom index.html into the Nginx web root directory
COPY index.html /usr/share/nginx/html/index.html
COPY ./images /usr/share/nginx/html/images
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80, which Nginx listens on by default
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]