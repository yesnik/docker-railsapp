FROM ruby:3-slim

ENV APP_PATH=/var/www/rails_app

RUN apt-get update && \
    apt-get install -y build-essential \
    # For PostgreSQL
    libpq-dev \
    # For the frontend
    nodejs \
    yarn

RUN mkdir -p $APP_PATH

ADD ./rails_app $APP_PATH

WORKDIR $APP_PATH
