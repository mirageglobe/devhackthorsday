FROM alpine:latest

ARG BUILD_DATE=0000-00-00
ARG VCS_REF=00000000

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mirageglobe/mynewproject.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="mynewproject-alpine" \
      org.label-schema.description="Docker image with mynewproject on alpine" \
      org.label-schema.url="https://github.com/mirageglobe/mynewproject"

ENV TERM=xterm \
    DEPS=nginx

# pre update requirements
RUN apk add $DEPS

WORKDIR /opt
EXPOSE 80

# default init
# COPY xxxxxx./docker-entrypoint.sh /usr/local/bin/

RUN apk add --no-cache tini
# Tini is now available at /sbin/tini
ENTRYPOINT ["/sbin/tini -vvv", "--"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]
 CMD ["tail", "-f", "/dev/null"]
# CMD ["rc-service nginx start && nginx -t"]
