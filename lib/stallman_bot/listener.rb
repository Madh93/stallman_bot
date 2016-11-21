require 'stallman_bot/commands'

module StallmanBot
  class Listener
    def initalize
      @listening = false
    end

    def listen(message, bot = nil)
      if command?(message)
        puts "command"
        # send(Commands.all[cmd], {message, bot})
      else
        puts "Filter and reply" #if @listening
      end
    end

    def command?(cmd)
      Commands.all.key?(cmd)
    end

    def reply
    end

    private :command?, :reply
  end
end
