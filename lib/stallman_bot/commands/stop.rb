require 'stallman_bot/commands/base'

module StallmanBot
  module Commands
    class Stop < Base
      def self.run(bot, id, _listening = nil)
        super(bot, id, "I'm going to sleep. See you!")
        false
      end
    end
  end
end
