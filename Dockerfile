FROM node:20-alpine
LABEL "project"="node" \
    "application"="Chess"

# Define the username
ARG USERNAME=nodejs

# Create the user and group
RUN adduser -D -h /apps -s /bin/sh ${USERNAME}

# Set working directory
WORKDIR /app

# Copy files and fix permissions
COPY --chown=${USERNAME}:${USERNAME} . /app/

# Install dependencies and build
RUN npm install && npm run build

# Switch to the non-root user
USER ${USERNAME}

# Expose the port
EXPOSE 4173

# Start the application
CMD [ "npm", "run", "preview", "--", "--host", "0.0.0.0" ]

