require 'stallman_bot/commands/base'

module StallmanBot
  module Commands
    class Stop < Base
      def self.run(bot, id, _listening = nil)
        super(bot, id, Locale.t('command.stop'))
        false
      end
    end
  end
end
