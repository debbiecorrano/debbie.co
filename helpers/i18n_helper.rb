module I18nHelper
  def current_locale_without_region
    I18n.locale.to_s.split("_").first
  end
end
