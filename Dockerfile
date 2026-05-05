FROM alpine:latest

RUN apk add --no-cache wget jq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]