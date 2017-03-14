FROM ruby:2.2

COPY pizza_builder-0.0.0.gem /usr/src/app/pizza_builder-0.0.0.gem
RUN gem install /usr/src/app/pizza_builder-0.0.0.gem
COPY Gemfile /usr/src/app/Gemfile
RUN cd /usr/src/app/ && bundle package
RUN cd /usr/src/app/ && bundle install --path vendor
RUN ls /usr/src/app/
