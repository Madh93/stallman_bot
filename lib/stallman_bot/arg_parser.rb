require 'optparse'

require 'stallman_bot/configuration'

module StallmanBot
  class ArgParser
    def self.parse(argv)
      options = Struct.new(*::StallmanBot::Configuration.valid_config_keys)
      args = options.new

      opt_parser = OptionParser.new do |opts|
        opts.banner = 'Usage: stallman_bot [options]'

        opts.on('-c', '--config FILE', 'YAML configuration bot') do |f|
          args.file = f
        end

        opts.on('-d', '--debug', 'Enable debug mode') do
          args.debug = true
        end

        opts.on('-n', '--name NAME', 'Telegram bot name') do |n|
          args.name = n
        end

        opts.on('-t', '--token TOKEN', 'Telegram bot token') do |t|
          args.token = t
        end

        opts.on('-v', '--version', 'Show version') do
          puts VERSION
          exit
        end

        opts.on('-h', '--help', 'Print this help') do
          puts opts
          puts "\nExamples:"
          puts "\t stallman_bot --name=cool_bot --token=8as7baub3ffasby32"
          puts "\t stallman_bot --config=my_bot_config.yaml"
          puts "\t stallman_bot \t# Find ./bot.yaml or load default config"
          exit
        end
      end

      opt_parser.parse!(argv)
      args.to_h.reject { |_, v| v.nil? }
    end
  end
end
