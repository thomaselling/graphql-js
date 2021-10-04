FROM node:latest

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm ci

# Bundle app source
COPY . .

RUN npx prisma generate

EXPOSE 4000

CMD [ "node", "src/index.js" ]