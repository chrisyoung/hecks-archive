FROM ruby:2.2

COPY vendor /usr/src/app/vendor

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock

run gem install bundler
RUN cd /usr/src/app/ && ls
RUN cd /usr/src/app/ && bundle install --path vendor
