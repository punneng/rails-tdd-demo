require 'rails_helper'

RSpec.describe ModelTypesController, type: :controller do
  describe '#GET index' do
    def get_model_types
      get :index, { model_id: 'serie_1' }
    end

    before :each do
      get_model_types
    end

    it 'should render as json' do
      response.header['Content-Type'].should include 'application/json'
    end

    it 'should contain model names'
    it 'should contain model types'
  end
end
