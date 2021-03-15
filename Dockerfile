FROM ruby:3-slim

ENV APP_PATH=/var/www/rails_app

RUN apt-get update && \
    apt-get install -y build-essential \
    curl \
    # For PostgreSQL
    libpq-dev \
    # For the frontend
    nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn

RUN gem install rails

RUN mkdir -p $APP_PATH

# ADD ./rails_app $APP_PATH

WORKDIR $APP_PATH

# We expose the port
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
