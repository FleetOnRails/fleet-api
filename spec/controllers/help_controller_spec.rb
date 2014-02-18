require 'spec_helper'

describe HelpController do

  describe "GET 'index'" do
    before { get :index }

    it 'Renders the help#index view' do
      should render_template('help/index')
    end
  end
end
