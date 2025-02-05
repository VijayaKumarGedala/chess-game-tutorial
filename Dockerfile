# FROM node:20-alpine
# LABEL "project"="node" \
#     "application"="Chess"

# # Define the username
# ARG USERNAME="nodejs"

# # Create the user and group
# RUN addgroup -S ${USERNAME} && adduser -S ${USERNAME} -G ${USERNAME}

# # Set working directory
# WORKDIR /app

# # Copy files and fix permissions
# COPY . /app/
# RUN chown -R ${USERNAME}:${USERNAME} /app

# # Install dependencies and build
# RUN npm install && npm run build

# # Switch to the non-root user
# USER ${USERNAME}

# # Expose the port
# EXPOSE 5173

# # Start the application
# CMD [ "npx", "run", "preview", "--", "--host", "0.0.0.0" ]

FROM node:20-alpine
LABEL project="learning"
ARG USERNAME=nodejs
RUN adduser -D -h /apps -s /bin/sh ${USERNAME}
USER ${USERNAME}
WORKDIR /apps
COPY --chown=${USERNAME}:${USERNAME} . /apps/
RUN npm install && npm run build
EXPOSE 4173
CMD ["npm","run","preview","--", "--host", "0.0.0.0"]