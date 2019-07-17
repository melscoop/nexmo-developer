class Navigation
  IGNORED_PATHS = ['..', '.', '.DS_Store'].freeze
  NAVIGATION    = YAML.load_file("#{Rails.root}/config/navigation.yml")
  WEIGHT        = NAVIGATION['navigation_weight']
  OVERRIDES     = NAVIGATION['navigation_overrides']

  def initialize(folder)
    @path = folder.fetch(:path)
  end

  def options
    @options ||= begin
      path_to_url.tr('/', '.').split('.').inject(OVERRIDES) { |h, k| h[k] || {} }
    end
  end

  def path_to_url
    @path.sub(%r{^\w+\/\w+\/}, '').gsub('.md', '')
  end
end
