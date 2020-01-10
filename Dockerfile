FROM alpine:latest

COPY requirements.pip /tmp/
RUN apk add --no-cache python3
RUN pip3 install --upgrade pip && \
    pip3 install -r /tmp/requirements.pip

CMD ["pelican", "-h"]

# Build-time metadata as defined at http://label-schema.org - last as it changes frequently
LABEL org.label-schema.name="alpine-pelican" \
      org.label-schema.description="Machine for maintaining a Pelican web site" \
      org.label-schema.url="https://github.com/chrisramsay/alpine-pelican" \
      org.label-schema.vcs-ref=$SOURCE_COMMIT \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0" \
      org.label-schema.maintainer="Chris Ramsay <chris@ramsay-family.net>"
