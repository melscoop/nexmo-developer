class SidenavResolver

  IGNORED_PATHS = ['..', '.', '.DS_Store'].freeze
  NAVIGATION = YAML.load_file("#{Rails.root}/config/navigation.yml")
  NAVIGATION_WEIGHT = NAVIGATION['navigation_weight']
  NAVIGATION_OVERRIDES = NAVIGATION['navigation_overrides']

  def initialize(path:, language:, namespace: nil)
    @path      = path
    @language  = language
    @namespace = namespace
  end

  def items
    if @path.starts_with?('app/views')
      directories(@path)[:children]
    else
      directories("#{@path}/#{I18n.default_locale}")[:children]
    end
  end

  private

  def directories(path, name = nil)
    data = { title: (name || path), path: path }
    data[:children] = []
    # Find all markdown files on disk that are children
    Dir.foreach(path) do |entry|
      next if entry.start_with?('.')
      next if IGNORED_PATHS.include? entry
      full_path = File.join(path, entry)
      if File.directory?(full_path)
        data[:children] << directories(full_path, entry)
      else
        doc_path = DocFinder.find(root: @path, document: full_path, language: @language, strip_root_and_language: true)
        data[:children] << { title: entry, path: doc_path, is_file?: true }
      end
    end

    # Do we have tasks for this product?
    product = path.sub(/\w+\/\w+\//, '')
    if DocumentationConstraint.product_with_parent_list.include? product
      if Tasks::TASKS[product]
        data[:children] << { title: 'tasks', path: ".#{product}/tasks", children: TASKS[product] }
      end
    end

    sort_navigation(data)
  end

  def sort_navigation(context)
    # Sort top level
    context[:children].sort_by! do |item|
      configuration_identifier = url_to_configuration_identifier(path_to_url(item[:path]))
      options = configuration_identifier.split('.').inject(NAVIGATION_OVERRIDES) { |h, k| h[k] || {} }

      sort_array = []
      sort_array << (options['navigation_weight'] || 1000) # If we have a path specific navigation weight, use that to explicitly order this
      sort_array << (item[:is_file?] ? 0 : 1) if context[:path].include? 'code-snippets' # Directories *always* go after single files for Code Snippets (priority 1 rather than 0). This even overrides config entries
      sort_array << item_navigation_weight(item) # If we have a config entry for this, use it. Otherwise put it at the end
      sort_array << (item[:is_file?] ? 0 : 1) # If it's a file it gets higher priority than a directory
      sort_array << navigation_weight_from_meta(item) # Use the config entry if we have it. Otherwise it goes to the end
      sort_array
    end

    # Sort children if needed
    context[:children].each do |child|
      sort_navigation(child) if child[:children]
    end

    context
  end

  def url_to_configuration_identifier(url)
    url.tr('/', '.')
  end

  def strip_namespace(path)
    path.sub(/\w+\/\w+\//, '')
  end

  def path_to_url(path)
    strip_namespace(path).gsub('.md', '')
  end

  def item_navigation_weight(item)
    title = if item[:is_task?]
      item[:title]
    elsif item[:is_file?]
      meta =  document_meta(item[:path])
      meta['navigation'] || meta['title']
    else
      item[:title]
    end
    NAVIGATION_WEIGHT[title] || 1000
  end

  def navigation_weight_from_meta(item)
    return 1000 unless item[:is_file?]
    document_meta(item[:path])['navigation_weight'] || 1000
  end

  def document_meta(path)
    doc = DocFinder.find(root: @path, document: path, language: @language, strip_root_and_language: true)
    Tasks.document_meta(doc)
  end
end
