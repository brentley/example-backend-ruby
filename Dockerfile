FROM alpine:3.6

# Install Sinatra
RUN apk --update upgrade && \
    apk --no-cache add curl ca-certificates bash && \
    apk --no-cache add ruby ruby-json && \
    apk --no-cache add ruby-dev g++ musl-dev make && \
    gem install sinatra thin --no-ri --no-rdoc && \
    apk --no-cache del ruby-dev g++ musl-dev make && \
    rm -rvf /root/* /var/cache/*

# Source code should be in the /usr/src/app folder
WORKDIR /usr/src/app
COPY . /usr/src/app

EXPOSE 4567

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

ENTRYPOINT /usr/local/bin/startup.sh
