FROM golang:1.18 as builder

COPY /server /src/server
WORKDIR /src/server

RUN CGO_ENABLED=0 GOOS=linux go build -a -o /usr/local/bin/server .

FROM caddy:2.5.2-alpine

RUN apk add bash

COPY Caddyfile /etc/caddy/Caddyfile

COPY client/dist /usr/share/caddy
COPY --from=builder /usr/local/bin/server /usr/local/bin/server

COPY start.sh /start.sh
CMD /start.sh