class Navigation
  IGNORED_PATHS        = ['..', '.', '.DS_Store'].freeze
  NAVIGATION           = YAML.load_file("#{Rails.root}/config/navigation.yml")
  NAVIGATION_WEIGHT    = NAVIGATION['navigation_weight']
  NAVIGATION_OVERRIDES = NAVIGATION['navigation_overrides']

  def initialize(folder)
    @path = folder.fetch(:path)
  end

  def options
    @options ||= begin
      configuration_identifier = @path.sub(/^\w+\/\w+\//, '').gsub('.md', '')
      configuration_identifier
        .split('.')
        .inject(NAVIGATION_OVERRIDES) { |h, k| h[k] || {} }
    end
  end

  def path_to_url
    @path.sub(/^\w+\/\w+\//, '').gsub('.md', '')
  end

  def url_to_configuration_identifier(url)
    url.tr('/', '.').sub(/^./, '')
  end
end
