require 'stallman_bot/configuration'

module StallmanBot
  class << self
    attr_reader :config
  end

  def self.configure(opts = {})
    @config ||= if opts[:file] || opts.empty?
                  Configuration.configure_with(opts[:file])
                else
                  Configuration.configure(opts)
                end
  end
end
