FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /Canile
WORKDIR /Canile
RUN bundle install
ADD . /Canile