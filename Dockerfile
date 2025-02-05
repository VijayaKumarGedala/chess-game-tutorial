FROM node:22-alpine3.20
LABEL "project"="node" \
    "application"="Chess"
ARG USERNAME="nodejs"
RUN addgroup -S ${USERNAME} && adduser -S ${USERNAME} -G ${USERNAME}
WORKDIR /app
COPY --chown=${USERNAME}:${USERNAME} . /app/
RUN chown -R ${USERNAME}:${USERNAME} /app/node_modules
USER ${USERNAME}
RUN npm install && npm run build
EXPOSE 4137
CMD [ "npm","run","preview","--","host","0.0.0.0" ]