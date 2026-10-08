# Nginx base image
FROM nginx:alpine

# Custom HTML page
RUN echo "<h1>Enterprise Multi-VM CI/CD Pipeline Deployed Successfully!</h1>" > /usr/share/nginx/html/index.html

# Expose port
EXPOSE 8080

# Configure nginx to listen on 8080
RUN sed -i 's/80;/8080;/g' /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]