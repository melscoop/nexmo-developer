class Sidenav

  attr_reader :request_path, :navigation, :product

  def initialize(request_path:, navigation:, product:, language:, namespace: nil)
    @request_path = request_path
    @navigation   = navigation
    @product      = product
    @language     = language
    @namespace    = namespace

    after_initialize!
  end

  def nav_items
    @nav_items ||= items.map do |item|
      SidenavItem.new(folder: item, sidenav: self)
    end
  end

  def namespace
    @namespace.presence || 'documentation'
  end

  private

  def after_initialize!
    if @namespace.present?
      @path = "app/views/#{@namespace}"
    else
      @path = "_documentation"
    end
  end

  def children
    @children ||= resolver.items
  end

  def items
    if @namespace.present?
      @context = [{
        title: @namespace,
        path: @path.gsub('app/views', ''),
        children: children,
      }]
    else
      children
    end
  end

  def resolver
    @resolver ||= SidenavResolver.new(
      path: @path,
      namespace: @namespace,
      language: @language,
    )
  end
end
