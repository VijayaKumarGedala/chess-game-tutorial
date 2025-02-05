FROM node:20-alpine
LABEL "project"="node" \
    "application"="Chess"
ARG USERNAME="nodejs"
RUN addgroup -S ${USERNAME} && adduser -S ${USERNAME} -G ${USERNAME}
WORKDIR /app
COPY --chown=${USERNAME}:${USERNAME} . /app/
USER ${USERNAME}
RUN npm install && npm run build
EXPOSE 4137
CMD [ "npm","run","preview","--","host","0.0.0.0" ]