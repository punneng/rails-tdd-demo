require 'rails_helper'

RSpec.describe ModelTypesController, type: :controller do
  describe '#GET index' do
    let!(:model) { create(:serie_1) }
    let(:res) { JSON.parse(@response.body) }

    def get_model_types
      get :index, { model_id: 'serie_1' }
    end

    before :each do
      get_model_types
    end

    it 'should render as json' do
      expect(response.header['Content-Type']).to include('application/json')
    end

    it 'should contain model names' do
      model = res['models'][0]
      expect(model.has_key?('name')).to be(true)
      expect(model['name']).to eq('serie 1')
    end

    it 'should contain model types with model type name' do
      model_type_1 = res['models'][0]['model_types'][0]
      model_type_2 = res['models'][0]['model_types'][1]
      expect(model_type_1['name']).to eq('bmw 116i')
      expect(model_type_2['name']).to eq('bmw 125i')
    end
  end
end
