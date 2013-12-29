require 'spec_helper'

describe ApiDocsController do

  describe "GET 'index'" do
    before { get :index }

    it 'Renders the help_docs#index view' do
      should render_template('api_docs/index')
    end
  end
end
