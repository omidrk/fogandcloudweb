FROM node:6

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json .

COPY package-lock.json .

RUN npm install

COPY . /usr/src/app

EXPOSE 4200
