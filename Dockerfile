FROM archlinux:latest

# Create directories
WORKDIR /soft-serve
# Expose data volume
#VOLUME /soft-serve

COPY . .

RUN pacman -Sy --noconfirm git base-devel && git clone https://aur.archlinux.org/soft-serve-git.git && cd soft-serve-git && makepkg -si

# Environment variables
ENV SOFT_SERVE_PORT "8080" 
ENV SOFT_SERVE_KEY_PATH "/soft-serve/ssh/soft_serve_server_ed25519"
ENV SOFT_SERVE_INITIAL_ADMIN_KEY ""
ENV SOFT_SERVE_REPO_PATH ".repos"

# Expose ports
# SSH
EXPOSE 8080/tcp

# Set the default command
ENTRYPOINT [ "soft serve" ]
