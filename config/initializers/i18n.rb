require "i18n/backend/fallbacks"
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)

# monkey patch globalize3 to not use fallbacks
module Globalize
  def self.i18n_fallbacks?
    Rails.configuration.globalize_fallbacks
  end
end