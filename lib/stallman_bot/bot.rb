require 'telegram/bot'

module StallmanBot
  class Bot
    def initialize(config)
      @config = config
      @token = @config[:token]
      # @listener = Listener.new
    end

    def run
      abort("Invalid token: #{@token}") if invalid_token?

      Telegram::Bot::Client.run(@token) do |bot|
        bot.listen do |message|
          begin
            puts "@listener: #{message}"
          rescue Telegram::Bot::Exceptions::ResponseError => e
            puts e
          end
        end
      end
    end

    def invalid_token?
      @token.empty?
    end

    private :invalid_token?
  end
end
