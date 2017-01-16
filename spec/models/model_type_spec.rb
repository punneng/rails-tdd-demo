require 'rails_helper'

RSpec.describe ModelType, type: :model do
  it { should belong_to(:model) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:model_type_slug) }
  it { should validate_presence_of(:model_type_code) }
  it { should validate_presence_of(:base_price) }

  it { should validate_uniqueness_of(:model_type_slug)}
  it { should validate_uniqueness_of(:model_type_code)}

  it { should validate_numericality_of(:base_price)}

  describe :total_price do
    let!(:pricing_policy) { double() }

    context 'flexible pricing' do
      let!(:model) { create(:serie_1) }
      let!(:model_type_1) { model.model_types[0] }

      before do
        allow(PricingPolicy::FlexiblePrice).to receive(:new).and_return(pricing_policy)
        allow(pricing_policy).to receive(:total_price).and_return(2)
      end

      subject { model_type_1.total_price }

      it 'should calculate with pricing policy FlexiblePrice' do
        expect(PricingPolicy::FlexiblePrice).to receive(:new)
        subject
      end
    end

    context 'fixed pricing' do
      let!(:model) { create(:serie_2) }
      let!(:model_type_1) { model.model_types[0] }

      before do
        allow(PricingPolicy::FixedPrice).to receive(:new).and_return(pricing_policy)
        allow(pricing_policy).to receive(:total_price).and_return(2)
      end

      subject { model_type_1.total_price }

      it 'should calculate with pricing policy FixedPrice' do
        expect(PricingPolicy::FixedPrice).to receive(:new)
        subject
      end
    end

    context 'prestige pricing' do
      let!(:model) { create(:serie_3) }
      let!(:model_type_1) { model.model_types[0] }

      before do
        allow(PricingPolicy::PrestigePrice).to receive(:new).and_return(pricing_policy)
        allow(pricing_policy).to receive(:total_price).and_return(2)
      end

      subject { model_type_1.total_price }

      it 'should calculate with pricing policy PrestigePrice' do
        expect(PricingPolicy::PrestigePrice).to receive(:new)
        subject
      end
    end
  end
end
