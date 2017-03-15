# Stallman_bot Dockerfile
FROM ruby:2.3-alpine
MAINTAINER Miguel Hernandez "michelangelo93@gmail.com"

# Install stallman_bot
RUN apk add --no-cache bash make git \
    && git clone https://github.com/Madh93/stallman_bot /app/stallman_bot \
    && cd /app/stallman_bot \
    && bundle install --without development test \
    && bundle exec rake install

# Container configuration
WORKDIR /app/stallman_bot

COPY bot.yaml config/bot.yaml

CMD ["--config=config/bot.yaml"]
ENTRYPOINT ["stallman_bot"]
