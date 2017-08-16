module LinksHelper
  def menu_link(title, link, **args)
    klass = current_page.url.sub(/(\/)+$/,'') === link.sub(/(\/)+$/,'') ? 'is-active' : nil
    args[:class] << " #{klass}"
    link_to title, "#{link}", args
  end
end
