class TitleNormalizer

  def self.call(folder)
    new(folder).normalize
  end

  def initialize(folder)
    @folder = folder
  end

  def normalize
    if @folder[:is_task?]
      @folder[:title]
    elsif @folder[:is_file?]
      Tasks.document_meta(@folder[:path])['navigation'] || Tasks.document_meta(@folder[:path])['title']
    else
      I18n.t("menu.#{@folder[:title]}")
    end
  end
end
