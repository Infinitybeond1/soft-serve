FROM ubuntu:latest

# Create directories
WORKDIR /soft-serve
# Expose data volume
#VOLUME /soft-serve

COPY . .

RUN echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
RUN sudo apt update && sudo apt install soft-serve

# Environment variables
ENV SOFT_SERVE_KEY_PATH "/soft-serve/ssh/soft_serve_server_ed25519"
ENV SOFT_SERVE_INITIAL_ADMIN_KEY ""
ENV SOFT_SERVE_REPO_PATH "/soft-serve/repos"

# Expose ports
# SSH
EXPOSE 23231/tcp

# Set the default command
ENTRYPOINT [ "soft", "serve" ]
