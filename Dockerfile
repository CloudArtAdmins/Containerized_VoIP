FROM docker.io/library/node:10

# Choose the port 
EXPOSE 8888

# Add app to image
COPY . /app

