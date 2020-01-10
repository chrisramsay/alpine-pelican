FROM alpine:latest

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="alpine-pelican" \
      org.label-schema.description="Machine for maintaining a Pelican web site" \
      org.label-schema.url="https://github.com/chrisramsay/alpine-pelican" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="git@github.com:chrisramsay/alpine-pelican.git" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0" \
      org.label-schema.maintainer="Chris Ramsay <chris@ramsay-family.net>"

COPY requirements.pip /tmp/
RUN apk add --no-cache python3
RUN pip3 install --upgrade pip && \
    pip3 install -r /tmp/requirements.pip

CMD ["pelican", "-h"]
