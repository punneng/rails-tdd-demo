require 'rails_helper'

RSpec.describe ModelType, type: :model do
  let!(:model) { create(:serie_1) }

  it { should belong_to(:model) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:model_type_slug) }
  it { should validate_presence_of(:model_type_code) }
  it { should validate_presence_of(:base_price) }

  it { should validate_uniqueness_of(:model_type_slug)}
  it { should validate_uniqueness_of(:model_type_code)}

  it { should validate_numericality_of(:base_price)}

  describe :total_price do
    context 'fixed pricing' do
      let!(:model_type_1) { model.model_types[0] }
      subject { model_type_1.total_price }

      it 'should calculate with pricing policy FlexiblePrice' do
        expect(PricingPolicy::FlexiblePrice).to receive(:new)
        subject
      end
    end
  end
end
