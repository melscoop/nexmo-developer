class SmartlingAPI
  def initialize(user_id:, user_secret:, project_id:)
    @client = Smartling::File.new(
      userId: user_id,
      userSecret: user_secret,
      projectId: project_id
    )
  end

  def upload(filename)
    file_uri = file_uri(filename)
    wrap_in_rescue { @client.upload(filename, file_uri, 'markdown', 'smartling.placeholder_format_custom': '§§.+?§§') }
  end

  def last_modified(filename:, locale:)
    file_uri = file_uri(filename)
    wrap_in_rescue { @client.last_modified(file_uri, locale) }
  end

  def download_translated(filename:, locale:, type: :published)
    file_uri = file_uri(filename)
    wrap_in_rescue { @client.download_translated(file_uri, locale, retrievalType: type) }
  end

  private

  def file_uri(filename)
    filename.gsub(%r{_documentation\/[a-z]{2}\/}, '')
  end

  def wrap_in_rescue
    yield
  rescue StandardError => e
    # TODO: handle exceptions
    Rails.logger.error(e.message)
  end
end
