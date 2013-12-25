class ApiDocsController < ApplicationController
  def index
    @category = 'README'
    render 'api_docs/index', layout: 'api_layout'
  end

  def show
    @category = params[:category]

    if File.exists?("#{Rails.root}/doc/api/#{@category}.md")
      render 'api_docs/show', layout: 'api_layout'
    else
      not_found!
    end
  end
end
