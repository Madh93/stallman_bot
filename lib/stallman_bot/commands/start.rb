require 'stallman_bot/commands/base'

module StallmanBot
  module Commands
    class Start < Base
      def self.run(bot, id, _listening = nil)
        super(bot, id, "Hi, my name is Richard M. Stallman.")
        true
      end
    end
  end
end
