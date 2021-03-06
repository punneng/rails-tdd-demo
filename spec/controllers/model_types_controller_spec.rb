require 'rails_helper'

RSpec.describe ModelTypesController, type: :controller do
  context 'with Authorization' do
    let(:res) { JSON.parse(@response.body) }
    describe '#GET index' do
      let!(:model) { create(:serie_1) }
      let!(:model_types_1) { model.model_types[0] }
      let!(:model_types_2) { model.model_types[1] }

      def get_model_types
        request.headers['Authorization'] = 'Bearer my-fake-token'
        get :index, { model_slug: 'serie_1' }
      end

      before do
        allow(model_types_1).to receive(:total_price).and_return(23)
        allow(model_types_2).to receive(:total_price).and_return(46)
        allow(Model).to receive(:find_by).and_return(model)
        get_model_types
      end

      it 'should render as json' do
        expect(response.header['Content-Type']).to include('application/json')
      end

      it 'should contain model names' do
        model_res = res['models'][0]
        expect(model_res.has_key?('name')).to be(true)
        expect(model_res['name']).to eq('serie 1')
      end

      it 'should contain model types with model type name' do
        model_type_1 = res['models'][0]['model_types'][0]
        model_type_2 = res['models'][0]['model_types'][1]
        expect(model_type_1['name']).to eq('bmw 116i')
        expect(model_type_2['name']).to eq('bmw 125i')
      end

      it 'should contain model types with model type total_price' do
        model_type_1 = res['models'][0]['model_types'][0]
        model_type_2 = res['models'][0]['model_types'][1]
        expect(model_type_1['total_price']).to eq(23)
        expect(model_type_2['total_price']).to eq(46)
      end
    end

    describe '#POST price' do
      let!(:model) { create(:serie_2) }
      let!(:model_types_1) { model.model_types[0] }

      def post_price
        request.headers['Authorization'] = 'Bearer my-fake-token'
        post :price, { model_slug: 'serie_2', model_type_slug: 'bmw_216i', base_price: 100 }
      end

      before do
        allow(Model).to receive(:find_by).and_return(model)
        allow(model.model_types).to receive(:find_by).and_return(model_types_1)
        allow(model_types_1).to receive(:total_price).and_return(23)
        post_price
      end

      it 'should render as json' do
        expect(response.header['Content-Type']).to include('application/json')
      end

      it 'should contain model types with model type name' do
        model_type_1 = res['model_type']
        expect(model_type_1['name']).to eq('bmw 216i')
      end

      it 'should contain model types with model type total_price' do
        model_type_1 = res['model_type']
        expect(model_type_1['total_price']).to eq(23)
      end
    end
  end

  context 'without Authorization' do
    describe '#GET index' do
      def get_model_types
        get :index, { model_slug: 'serie_1' }
      end

      before do
        get_model_types
      end

      it 'should render as json' do
        expect(response.header['Content-Type']).to include('application/json')
      end

      it 'should render Not authenticated' do
        expect(JSON.parse(response.body)['errors']).to eq('Not authenticated')
      end
    end
  end

  context 'with Bad request' do
    describe '#POST price' do
      let!(:model) { create(:serie_2) }
      let!(:model_types_1) { model.model_types[0] }

      def post_price
        request.headers['Authorization'] = 'Bearer my-fake-token'
        post :price, { model_slug: 'serie_2', model_type_slug: 'bmw_216i', wrong_base_price: 100 }
      end

      before do
        post_price
      end

      it 'should render as json' do
        expect(response.header['Content-Type']).to include('application/json')
      end

      it 'should render bad request' do
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['errors']).to eq('Bad request')
      end
    end
  end
end
