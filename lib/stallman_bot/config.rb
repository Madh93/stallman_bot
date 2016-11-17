require 'yaml'

module StallmanBot
  class << self
    attr_reader :config, :valid_config_keys
  end

  @config = {
    debug: false,
    file: '',
    token: '',
    locale: 'en'
  }

  @valid_config_keys = @config.keys

  def self.configurate(opts = {})
    opts.each do |k, v|
      @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym
    end
  end

  def self.configurate_with(file)
    begin
      config = YAML.load_file(file)
    rescue Errno::ENOENT
      puts 'YAML configuration file couldn\'t be found. Using defaults.'
      return
    rescue Psych::SyntaxError
      puts 'YAML configuration file contains invalid syntax. Using defaults'
      return
    end
    configurate(config)
  end
end
