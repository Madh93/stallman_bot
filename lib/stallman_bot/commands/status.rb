require 'stallman_bot/commands/base'

module StallmanBot
  module Commands
    class Status < Base
      def self.run(bot, id, listening = nil)
        if listening
          super(bot, id, "I'm listening...")
        else
          super(bot, id, "I'm trying to sleep...")
        end
        listening
      end
    end
  end
end
