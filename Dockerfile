# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /myapp

# add `/myapp/node_modules/.bin` to $PATH
ENV PATH /myapp/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add myapp
COPY . ./

# start myapp
CMD ["npm", "start"]