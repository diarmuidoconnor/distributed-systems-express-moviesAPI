FROM node:16  AS builder

WORKDIR /usr/src/app

COPY package*.json ./
COPY .babelrc ./
RUN npm install
COPY ./api ./api
COPY ./authenticate ./authenticate
COPY ./db ./db
COPY ./seedData ./seedData

COPY ./index.js ./
COPY ./public ./public
RUN npm run build

FROM node:16 

WORKDIR /usr/src/app

COPY package*.json ./
COPY .babelrc ./
RUN npm ci --omit=dev
COPY --from=builder /usr/src/app/build ./build

CMD npm run start:prod