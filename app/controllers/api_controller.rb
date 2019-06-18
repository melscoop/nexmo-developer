class ApiController < ApplicationController
  before_action :require_locale, only: :show
  before_action :set_language
  before_action :set_document
  before_action :set_navigation

  def index
    @document_title = 'API Reference'
    render layout: 'application'
  end

  private

  def set_code_language
    return if request.params[:code_language] == 'templates'
    super
  end

  def set_navigation
    @navigation = :api

    # If side navigation is not present then the navigation_from_content helper will be used
    @side_navigation = "api/#{@document}"
  end

  def set_product
    @product = params[:product]
  end

  def set_document
    if params[:code_language] == 'templates'
      @document = 'verify/templates'
    elsif params[:code_language] == 'ncco'
      @document = 'voice/ncco'
    else
      @document = params[:document]
    end
  end

  def require_locale
    return if params[:namespace]

    unless params[:locale]
      redirect_to url_for(
        document: "#{params[:document]}",
        controller: :api,
        action: :show,
        locale: I18n.locale,
        only_path: true,
      ), status: :moved_permanently
    end
  end
end
