
module StallmanBot
  class Logger
    def initialize(bot=nil)
      puts bot.object_id
      puts "Hola desde Logger"
    end
  end
end
