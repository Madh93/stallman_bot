# Stallman_bot

A Richard Stallman bot for Telegram based on [Slack Hubot](https://github.com/interwho/stallman-bot) by Justin Paulin.

![](http://oi67.tinypic.com/2mes3lg.jpg)

## Installation

Clone:

    git clone https://github.com/Madh93/stallman_bot && cd stallman_bot

Install dependencies:

    bundle
And install stallman_bot:

    bundle exec rake install

## Usage

    stallman_bot [OPTIONS]

Start stallman_bot with default config (or custom config if it finds a `bot.yaml` in path):

    stallman_bot

Load custom config explicitly:

    stallman_bot --config=configs/cool_config.yaml

For the rest of options:

    stallman_bot --help

## Contributing

1. Fork it ( https://github.com/Madh93/stallman_bot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
