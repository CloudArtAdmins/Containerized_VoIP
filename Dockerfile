FROM docker.io/library/node:alpine

# Choose the port 
EXPOSE 8888

# Install app dependencies
WORKDIR /app
COPY package*.json .
RUN npm install 

# Install app
COPY . .


CMD [ "node", "app.js" ]
