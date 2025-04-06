# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

# Install Docker CLI and ffmpeg
RUN apk add --no-cache docker-cli ffmpeg
RUN apk add --update python3 py3-pip gcc python3-dev musl-dev curl ffmpeg
RUN apk add --update python3 py3-pip curl && pip3 install --upgrade yt-dlp

# Create the docker group if it does not exist and add the 'node' user to it
RUN addgroup -S docker || true
RUN addgroup node docker

# Switch back to the default user 'node'
USER node
