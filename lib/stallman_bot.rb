require 'stallman_bot/version'
require 'stallman_bot/config'

module StallmanBot
  class StallmanBot
    attr_accessor :debug, :token

    def initialize(opts = {})
      if opts[:file]
        ::StallmanBot.configurate_with(opts[:file])
      else
        ::StallmanBot.configurate(opts)
      end
    end

    def run
      puts 'bot running...'
    end
  end
end
