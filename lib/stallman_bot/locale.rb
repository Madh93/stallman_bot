require 'i18n'

module StallmanBot
  class Locale
    def self.load_i18n(locale)
      config = File.expand_path('../../config/locales', File.dirname(__FILE__))
      I18n.load_path = Dir["#{config}/*.yml"]
      begin
        I18n.locale = locale
      rescue I18n::InvalidLocale
        puts "Locale '#{locale}' couldn't be found. Using default 'en'."
        I18n.locale = I18n.default_locale
      end
    end

    def self.t(s)
      I18n.t(s, raise: I18n::MissingTranslationData)
    rescue I18n::MissingTranslationData
      I18n.t(s, locale: I18n.default_locale, default: missing(s))
    end

    def self.replies
      I18n.t(:reply, I18n::MissingTranslationData).keys.map(&:to_s)
    rescue I18n::MissingTranslationData
      I18n.t(:reply, locale: I18n.default_locale, default: missing('reply'))
    end

    def self.missing(s)
      "Missing translation '#{s}' in locale."
    end

    class << self
      private :missing
    end
  end
end
