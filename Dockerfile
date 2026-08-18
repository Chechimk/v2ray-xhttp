FROM alpine:latest
EXPOSE 8080
WORKDIR /app
RUN apk add --no-cache wget unzip \
 && wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
 && unzip Xray-linux-64.zip \
 && rm Xray-linux-64.zip \
 && rm -f config.json \
 && chmod +x /app/xray
COPY config.json entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
