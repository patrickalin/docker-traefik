FROM traefik:v1.5.1-alpine
COPY traefik.toml /etc/traefik/traefik.toml
COPY localtime /etc/localtime
RUN apk add --update bash curl
#HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1
