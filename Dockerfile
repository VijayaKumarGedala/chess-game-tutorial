FROM node:22-alpine3.20
RUN npm install
RUN npm run build
RUN npm run build