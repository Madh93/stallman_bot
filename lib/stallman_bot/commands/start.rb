require 'stallman_bot/commands/base'

module StallmanBot
  module Commands
    class Start < Base
      def self.run(bot, id, _listening = nil)
        super(bot, id, Locale.t('command.start'))
        true
      end
    end
  end
end
