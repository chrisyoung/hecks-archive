FROM ruby:2.2

COPY *.gem /usr/src/app/

RUN cd /usr/src/app/ && gem install hecks-adapters -v 0.1.2
RUN cd /usr/src/app/ && gem install hecks-adapters-resource-server -v 0.1.2
RUN cd /usr/src/app/ && gem install hecks-adapters-sql-database -v 0.1.2
RUN cd /usr/src/app/ && gem install hecks-adapters-resource-server -v 0.1.2
RUN cd /usr/src/app/ && gem install hecks-domain -v 0.1.2
RUN cd /usr/src/app/ && gem install pizza_builder

COPY Gemfile /usr/src/app/Gemfile
RUN cd /usr/src/app/ && bundle package
RUN cd /usr/src/app/ && bundle install --path vendor
