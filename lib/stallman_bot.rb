require 'telegram/bot'

require 'stallman_bot/version'
require 'stallman_bot/configuration'
require 'stallman_bot/commands'

require 'stallman_bot/logger'
require 'stallman_bot/listener'

module StallmanBot
  class << self
    attr_reader :config
  end

  def self.configure(opts = {})
    @config ||= if opts[:config] || opts.empty?
                  Configuration.configure_with(opts[:config])
                else
                  Configuration.configure(opts)
                end
  end
end


# module StallmanBot
#   class StallmanBot
#     def initialize(opts = {})
#       if opts[:file] || opts.empty?
#         ::StallmanBot.configurate_with(opts[:file])
#       else
#         ::StallmanBot.configurate(opts)
#       end
#       @config = ::StallmanBot.config
#       @token = @config[:token]
#       @listener = Listener.new
#     end
#
#     def run
#       puts 'bot running...'
#       # puts ::StallmanBot.config
#       # puts self.class.ancestors
#
#       # Logger.new
#
#
#
#
#
#
#
#
#     # when '/status', '/status@RichardStallman_bot'
#     #   bot.api.send_message(
#     #     chat_id: message.chat.id,
#     #     text: stallman.command(
#     #       cmd: 'status',
#     #       chat: message.chat.id
#     #     )
#     #   )
#
#
#       # if ::StallmanBot.config().empty?
#       #   puts "token vacio... saliendo..."
#       #   exit
#       # end
#       #
#       Telegram::Bot::Client.run(@token) do |bot|
#         bot.listen do |message|
#           begin
#             listen(bot, message)
#           rescue Telegram::Bot::Exceptions::ResponseError => e
#             puts e
#           end
#         end
#       end
#     end
#
#     def listen(bot, message)
#
#     end
#
#     private :listen
#   end
# end
