module ContentfulHelper
  def contentful_t(key, locale: I18n.locale)
    locale_mapping = {
      de: "de-AT",
      en: "en-US",
    }
    entry = data.contentful.I18n.values.detect{ |entry| entry.id.values.first == key }
    if entry && entry.translation[locale_mapping[locale]]
      entry.translation[locale_mapping[locale]]
    else
      "Translation missing: #{I18n.locale.to_s}.#{key}"
    end
  end
end
