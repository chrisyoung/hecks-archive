FROM ruby:2.2

COPY vendor /usr/src/app/vendor

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock
run gem uninstall -i /usr/local/lib/ruby/gems/2.2.0 bundler --force -x
run gem install bundler -v 1.9.9
run gem list bundler
RUN cd /usr/src/app/ && ls
RUN cd /usr/src/app/ && bundle install --path vendor
