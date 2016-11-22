require 'stallman_bot/commands'

module StallmanBot
  class Listener
    def initialize
      @listening = false
      @cmd = Commands.all
    end

    def listen(message, bot = nil, id = nil)
      if command?(message)
        @listening = run_command(message, bot, id)
      else
        puts "Filter and reply" #if @listening
      end
    end

    def command?(cmd)
      @cmd.key?(cmd)
    end

    def run_command(command, bot, id)
      Object.const_get(@cmd[command]).run(bot, id, @listening)
    end

    def reply
    end

    private :command?, :run_command, :reply
  end
end
