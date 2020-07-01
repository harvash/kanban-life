FROM node:14.4.0-alpine3.11
LABEL maintainer="Harvash <harvash2004@yahoo.com>"

RUN mkdir -p /home/node/server && chown node:node /home/node/server

WORKDIR /home/node/server

COPY --chown=node:node package*.json ./app

USER node

RUN npm install && npm cache clean --force --loglevel=error

RUN npm install express socket.io pg

COPY --chown=node:node server.js ./app
COPY --chown=node:node css ./app/css
COPY --chown=node:node db ./app/db
COPY --chown=node:node routes ./app/routes