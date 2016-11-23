module StallmanBot
  module Commands
    class Base
      def self.run(bot, id, message)
        if bot.nil? || id.nil?
          puts message
        else
          bot.api.send_message(chat_id: id, text: message)
        end
      end
    end
  end
end
