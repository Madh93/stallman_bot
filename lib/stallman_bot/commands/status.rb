require 'stallman_bot/commands/base'

module StallmanBot
  module Commands
    class Status < Base
      def self.run(bot, id, listening = nil)
        if listening
          super(bot, id, Locale.t('command.status.listening'))
        else
          super(bot, id, Locale.t('command.status.sleeping'))
        end
        listening
      end
    end
  end
end
