class SidenavResolver

  IGNORED_PATHS = ['..', '.', '.DS_Store'].freeze
  NAVIGATION = YAML.load_file("#{Rails.root}/config/navigation.yml")
  NAVIGATION_WEIGHT = NAVIGATION['navigation_weight']
  NAVIGATION_OVERRIDES = NAVIGATION['navigation_overrides']

  def initialize(path:, namespace_root:, namespace: nil)
    @path           = path
    @namespace_root = namespace_root
    @namespace      = namespace
  end

  def items
    directories(@path)[:children]
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
        data[:children] << { title: entry, path: full_path, is_file?: true }
      end
    end

    # Do we have tasks for this product?
    product = path.gsub(%r{.*#{@namespace_root}/}, '')
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
      sort_array << (NAVIGATION_WEIGHT[normalised_title(item)] || 1000) # If we have a config entry for this, use it. Otherwise put it at the end
      sort_array << (item[:is_file?] ? 0 : 1) # If it's a file it gets higher priority than a directory
      sort_array << (item[:is_file?] && document_meta(item[:path])['navigation_weight'] ? document_meta(item[:path])['navigation_weight'] : 1000) # Use the config entry if we have it. Otherwise it goes to the end
      sort_array
    end

    # Sort children if needed
    context[:children].each do |child|
      sort_navigation(child) if child[:children]
    end

    context
  end

  def url_to_configuration_identifier(url)
    url.tr('/', '.').sub(/^./, '')
  end

  def path_to_url(path)
    path.gsub(%r{.*#{@namespace_root}}, '').gsub('.md', '')
  end

  def normalised_title(item)
    if item[:is_task?]
      item[:title]
    elsif item[:is_file?]
      document_meta(item[:path])['navigation'] || document_meta(item[:path])['title']
    else
      I18n.t("menu.#{item[:title]}")
    end
  end

  def document_meta(path)
    Tasks.document_meta(path)
  end
end
