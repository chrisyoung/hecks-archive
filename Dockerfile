FROM ubuntu:latest

MAINTAINER chriswyoung "https://github.com/chrisyoung"

# Install packages for building ruby
RUN apt-get update
RUN apt-get install -y --force-yes build-essential wget git
RUN apt-get install -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

RUN wget -P /root/src http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.5.tar.gz
RUN cd /root/src; tar xvf ruby-2.2.5.tar.gz
RUN cd /root/src/ruby-2.2.5; ./configure; make install

RUN gem update --system
RUN gem install bundler

ADD . /app
WORKDIR /app/examples/pizzas/pizzas_hexagon/lib/adapters/server

RUN cd /app/examples/pizzas; ruby build_gems.rb

EXPOSE 9292
CMD ["/usr/local/bin/rackup", "config.ru", "-p", "9292", "-o", "0.0.0.0"]
