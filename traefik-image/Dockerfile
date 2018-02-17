FROM traefik:v1.5.2-alpine
COPY traefik.toml /etc/traefik/traefik.toml
COPY localtime /etc/localtime
RUN apk add --update bash curl
HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD curl -f http://localhost:81/ping || exit 1
