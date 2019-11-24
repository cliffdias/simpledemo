FROM node:alpine
WORKDIR /app

COPY ./package.json ./

RUN npm install

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-19.03.0-ce.tgz \
    && tar xzvf docker-19.03.0-ce.tgz \
    && mv docker/docker /usr/local/bin \
    && rm -r docker docker-19.03.0-ce.tgz

COPY . .

CMD ["npm", "run", "start"]