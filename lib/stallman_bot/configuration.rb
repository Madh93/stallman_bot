require 'yaml'

module StallmanBot
  class Configuration
    class << self
      attr_reader :valid_config_keys
    end

    @config = {
      debug: false,
      file: '',
      token: '',
      locale: 'en'
    }

    @valid_config_keys = @config.keys

    def self.configure(opts = {})
      opts.each do |k, v|
        @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym
      end
      @config
    end

    def self.configure_with(file)
      begin
        config = YAML.load_file(file ||= 'bot.yaml')
      rescue Errno::ENOENT
        puts 'YAML configuration file couldn\'t be found. Using defaults.'
        return
      rescue Psych::SyntaxError
        puts 'YAML configuration file contains invalid syntax. Using defaults'
        return
      end
      @config[:file] = file
      configure(config)
    end
  end
end
