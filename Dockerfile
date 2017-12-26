FROM ruby:alpine

# Install Sinatra
RUN apk --update upgrade && \
    apk --no-cache add curl ca-certificates bash && \
    apk --no-cache add ruby ruby-dev ruby-json && \
    gem install sinatra --no-ri --no-rdoc && \
    # apk --no-cache add ruby ruby-dev ruby-json ruby-libs && \
    apk --no-cache add g++ musl-dev make && \
    gem install sinatra --no-ri --no-rdoc && \
    gem install thin --no-ri --no-rdoc 

# Source code should be in the /usr/src/app folder
WORKDIR /usr/src/app
COPY . /usr/src/app

EXPOSE 4567

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

ENTRYPOINT /usr/local/bin/startup.sh
