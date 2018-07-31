FROM ruby:latest

RUN gem install rspec
WORKDIR /app
