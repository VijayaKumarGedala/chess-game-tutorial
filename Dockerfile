FROM node:20-alpine
LABEL "project"="node" \
    "application"="Chess"

# Define the username
ARG USERNAME="nodejs"

# Create the user and group
RUN addgroup -S ${USERNAME} && adduser -S ${USERNAME} -G ${USERNAME}

# Set working directory
WORKDIR /app

# Copy files and fix permissions
COPY . /app/
RUN chown -R ${USERNAME}:${USERNAME} /app

# Install dependencies and build
RUN npm install && npm run build

# Switch to the non-root user
USER ${USERNAME}

# Expose the port
EXPOSE 4137

# Start the application
CMD [ "npm","run","preview","--","host","0.0.0.0" ]
