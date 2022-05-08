#  Dockerfile for Node Express Backend

FROM node

# Create App Directory

WORKDIR /usr/src/app

# Install Dependencies
COPY ./package*.json ./

RUN npm install --silent

# Copy app source code
COPY . .

# Exports
EXPOSE 3005

CMD ["npm","start"]
