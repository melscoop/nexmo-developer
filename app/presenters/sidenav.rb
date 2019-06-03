class Sidenav

  attr_reader :request_path, :navigation, :product

  def initialize(path:, namespace_root:, request_path:, navigation: , product:, namespace: nil)
    @path           = path
    @namespace      = namespace
    @namespace_root = namespace_root
    @request_path   = request_path
    @navigation     = navigation
    @product        = product
    @children       = resolver.items
  end

  def nav_items
    @nav_items ||= items.map do |item|
      SidenavItem.new(folder: item, namespace_root: @namespace_root, sidenav: self)
    end
  end

  def namespace
    @namespace.presence || 'documenation'
  end

  private

  def items
    if @namespace.present?
      @context = [{
        title: @namespace,
        path: @path.gsub('app/views', ''),
        children: @children,
      }]
    else
      @children
    end
  end

  def resolver
    @resolver ||= SidenavResolver.new(
      path: @path,
      namespace_root: @namespace_root,
      namespace: @namespace,
    )
  end
end
