# require 'stallman_bot/commands/start'

module StallmanBot
  module Commands
    def self.commands
      path = File.join(File.dirname(__FILE__), 'commands')
      files = Dir.entries(path).select { |f| f.include?('.rb') }
      commands = {}
      files.each do |f|
        name = f[0..-4]
        method = "Commands::#{name.capitalize}.run"
        commands["/#{name}"] = method
        commands["/#{name}@RichardStallman_bot"] = method
      end
      commands
    end

    def self.all
      @all ||= commands
    end

    class << self
      private :commands
    end
  end
end
