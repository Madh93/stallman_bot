require 'stallman_bot/configuration'

module StallmanBot
  class << self
    attr_reader :config
  end

  def self.configure(opts = {})
    @config ||= if opts[:config] || opts.empty?
                  Configuration.configure_with(opts[:config])
                else
                  Configuration.configure(opts)
                end
  end
end
