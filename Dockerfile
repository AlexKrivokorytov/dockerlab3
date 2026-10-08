FROM debian:13-slim

LABEL maintainer="Oleksandr Krivokorytov <6.1214-pi2>" \
      version="1.0" \
      description="Caddy Web Server on Debian 13 Slim"

RUN apt-get update && apt-get install -y --no-install-recommends \
    caddy \
    debian-archive-keyring \
    && rm -rf /var/lib/apt/lists/*

COPY index.html /usr/share/caddy/index.html

EXPOSE 80

CMD ["caddy", "file-server", "--root", "/usr/share/caddy", "--listen", ":80"]