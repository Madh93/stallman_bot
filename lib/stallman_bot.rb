require 'stallman_bot/version'

module StallmanBot
  class StallmanBot
    attr_accessor :debug, :token

    def initialize(opt = {})
      if block_given?
        yield self
      else
        @debug = opt[:debug]
        @token = opt[:token]
      end
    end

    def run
      puts "bot corriendo"
    end
  end
end
