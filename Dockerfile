FROM alpine:latest

MAINTAINER "Chris Ramsay" <chris@ramsay-family.net>

COPY requirements.pip /tmp/
RUN apk add --no-cache python3
RUN pip3 install --upgrade pip && \
    pip3 install -r /tmp/requirements.pip

CMD ["pelican", "-h"]
