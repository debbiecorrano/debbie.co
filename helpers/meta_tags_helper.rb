module MetaTagsHelper

  def meta_tag_site_url
    host_url(current_page.url)
  end

  def meta_tag_site_name
    data.config.page.name
  end

  def meta_tag_title
    title = I18n.t("meta.#{current_path_without_locale}.title", locale: I18n.locale)

    if title.start_with?('translation missing:') || title.empty?
      title = I18n.t("meta.default.title", locale: I18n.locale)
    end

    "#{title} #{data.config.page.title_separator} #{data.config.page.name}"
  end

  def meta_tag_description
    description = I18n.t("meta.#{current_path_without_locale}.description", locale: I18n.locale)

    if description.start_with?('translation missing:') || description.empty?
      description = I18n.t("meta.default.description", locale: I18n.locale)
    end

    description
  end

  def meta_tag_keywords
    keywords = I18n.t("meta.#{current_path_without_locale}.keywords", locale: I18n.locale)

    if keywords.start_with?('translation missing:') || keywords.empty?
      keywords = I18n.t("meta.default.keywords", locale: I18n.locale)
    end

    keywords
  end

  def meta_tag_image
    if current_page.data.meta_tag_image
      path = image_path(current_page.data.meta_tag_image)
    else
      path = image_path(data.config.page.image)
    end

    host_url(path)
  end

end
