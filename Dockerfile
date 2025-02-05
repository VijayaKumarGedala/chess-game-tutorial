FROM node:22-alpine3.20
LABEL "project"="node" \
    "application"="Chess"
ARG USERNAME="nodejs"
RUN addgroup -S ${USERNAME} && adduser -S ${USERNAME} -G ${USERNAME}
WORKDIR /app
COPY . /app
USER ${USERNAME}
COPY --chown=${USERNAME}:${USERNAME} . /app/
RUN npm install && npm run build
RUN npm run preview
EXPOSE 4137
CMD [ "npm","run","preview","--","host","0.0.0.0" ]