class SidenavSubitem < SidenavItem

  def title
    @title ||= TitleNormalizer.call(@folder)
  end

  def file?
    @folder[:is_file?]
  end

  def collapsible?
    @options['collapsible'].nil? || @options['collapsible']
  end

  def url
    @url ||= url_for(
      document: Navigation.new(@folder, @namespace_root).path_to_url.sub(/^./, ''),
      controller: :markdown,
      action: :show,
      locale: I18n.locale,
      only_path: true,
    )
  end

  def active?
    if navigation == :tutorials
      url == "/#{product}/tutorials"
    else
      url == request_path
    end
  end

  def link_css_class
    active? ? 'Vlt-sidemenu__link_active' : ''
  end
end
