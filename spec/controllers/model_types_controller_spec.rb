require 'rails_helper'

RSpec.describe ModelTypesController, type: :controller do
  descript '#GET /models/:model_slug/model_types' do
    def get_model_types
      get :index, { model_slug: 'serie_1' }
    end

    before :each do
      get_model_types
    end

    it 'should render as json' do
      response.header['Content-Type'].should include 'application/json'
    end

    it 'should contain model names' do

    end

    it 'should contain model types' do

    end
  end
end
