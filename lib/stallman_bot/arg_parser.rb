require 'optparse'

module StallmanBot
  class ArgParser
    def self.parse(argv)
      options = Struct.new(*::StallmanBot.valid_config_keys)
      args = options.new

      opt_parser = OptionParser.new do |opts|
        opts.banner = 'Usage: stallman_bot [options]'

        opts.on('-c', '--config FILE', 'YAML configuration bot') do |f|
          args.file = f
        end

        opts.on('-d', '--debug', 'Enable debug mode') do
          args.debug = true
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
          puts 'Example: stallman_bot --token=8as7baub3ffasby3f2'
          exit
        end
      end

      opt_parser.parse!(argv)
      args.to_h.reject { |_, v| v.nil? }
    end
  end
end
