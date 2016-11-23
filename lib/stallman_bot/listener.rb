require 'stallman_bot/commands'

module StallmanBot
  class Listener
    def initialize
      @listening = false
      @cmd = Commands.all
      @replies = Locale.replies
    end

    def respond(message, bot = nil, id = nil)
      if command?(message)
        @listening = run_command(message, bot, id)
      elsif @listening
        answer = filter(message)
        Commands::Base.run(bot, id, answer) unless answer.nil?
      end
    end

    def command?(cmd)
      @cmd.key?(cmd)
    end

    def run_command(command, bot, id)
      Object.const_get(@cmd[command]).run(bot, id, @listening)
    end

    def filter(message)
      replies = @replies.select { |x| message.downcase.include?(x) }
      Locale.t("reply.#{replies.sample}") unless replies.empty?
    end

    private :command?, :run_command, :filter
  end
end
