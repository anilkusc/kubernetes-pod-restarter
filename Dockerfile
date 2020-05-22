FROM alpine
RUN apk add curl
WORKDIR /scripts/
COPY . .
RUN chmod -R 777 /scripts/
