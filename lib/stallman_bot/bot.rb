require 'telegram/bot'

require 'stallman_bot/listener'
require 'stallman_bot/locale'

module StallmanBot
  class Bot
    def initialize(config)
      @config = config
      @token = @config[:token]
      @debug = @config[:debug]
      Locale.load_i18n(@config[:locale])
      @listener = Listener.new
    end

    def run
      puts "Stallman_bot running... (DEBUG: #{@debug})"
      if @debug
        local_handler
      elsif @token.empty?
        puts "Invalid/empty token: #{@token}"
        exit
      else
        bot_handler
      end
    end

    def bot_handler
      Telegram::Bot::Client.run(@token) do |bot|
        bot.listen do |message|
          begin
            @listener.respond(message.text, bot, message.chat.id)
          rescue Telegram::Bot::Exceptions::ResponseError => e
            puts e
          end
        end
      end
    end

    def local_handler
      loop do
        begin
          message = gets.chomp
        rescue Interrupt
          exit
        end
        @listener.respond(message)
      end
    end

    private :bot_handler, :local_handler
  end
end
