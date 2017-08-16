module UrlsHelper
  def host_url(path)
    url = build? ? data.config.page.url : 'http://localhost:4567'
    URI.join(url, path).to_s
  end

  def current_path_without_locale
    current_page.target_resource.page_id.sub(/^#{config[:templates_dir]}\//, '')
  end

  def current_path_for_locale(locale)
    localize_path current_path_without_locale, locale: locale
  end

  def localize_path(path, locale: I18n.locale)
    mount_at_root = extensions[:i18n].options[:mount_at_root].to_s
    localized_path = path == "index" ?  "" : I18n.t("paths.#{path}", locale: locale)
    localized_path = "/#{localized_path}" unless localized_path.start_with?("/")

    return mount_at_root.to_s == locale.to_s ? "#{localized_path}" : "/#{locale}#{localized_path}"
  end
end
