class HelpController < ApplicationController
  def index
    render 'help/index'
  end

  def api
    @category = params[:category]
    @category = 'README' if @category.blank?

    #if File.exists?(Rails.root.join('doc', 'api', @category + '.md'))
    if File.exists?("#{Rails.root}/doc/api/#{@category}.md")
      render 'help/api', layout: 'api_layout'
    else
      not_found!
    end
  end
end
