FROM nodesource/node:5.7

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Install Gulp
RUN npm install -g gulp
RUN npm install gulp

# Bundle app source
COPY . /usr/src/app

# Complile source
RUN gulp compile

EXPOSE 1111
CMD [ "node", "build/server.js" ]