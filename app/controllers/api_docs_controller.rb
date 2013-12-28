class ApiDocsController < ApplicationController
  def index
    @category = params[:category]
    @category = 'readme' if @category.blank?

    if File.exists?("#{Rails.root}/public/doc/api/#{@category}.md")
      render 'api_docs/index'
    else
      not_found!
    end
  end
end
