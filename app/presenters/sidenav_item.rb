class SidenavItem

  delegate :request_path, :navigation, :product, to: :@sidenav

  def initialize(folder:, namespace_root:, sidenav:)
    @folder         = folder
    @namespace_root = namespace_root
    @sidenav        = sidenav
    @options        = Navigation.new(folder, namespace_root).options
  end

  def svg?
    svg && svg_color
  end

  def svg
    @options['svg'] && "/symbol/volta-icons.svg#Vlt-icon-#{@options['svg']}"
  end

  def svg_color
    @options['svgColor'] && "Vlt-#{@options['svgColor']}"
  end

  def label?
    label.present?
  end

  def label
    @options['label']
  end

  def children
    @children ||= (@folder[:children] || []).map do |child|
      SidenavSubitem.new(folder: child, namespace_root: @namespace_root, sidenav: @sidenav)
    end
  end

  def css_classes
    classes = ['Vlt-badge Vlt-badge--margin-left']
    classes << 'Vlt-bg-green-lighter Vlt-green' if label.casecmp('beta').zero?
    classes << 'Vlt-bg-blue-lighter Vlt-blue' if label.casecmp('dev preview').zero?

    classes.join(' ')
  end

  def link_url
    "/product-lifecycle/#{label.downcase.tr(' ', '-')}"
  end

  def normalized_title
    @normalized_title ||= TitleNormalizer.call(@folder)
  end

  def title
    @folder[:title]
  end
end
