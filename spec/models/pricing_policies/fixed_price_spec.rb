require 'rails_helper'

RSpec.describe PricingPolicy::FixedPrice do

  before do
    allow(HTTParty).to receive(:get)
                       .with('http://www.reuters.com/')
                       .and_return('just stub this first')
  end

  describe 'margin' do
    subject { PricingPolicy::FixedPrice.new(100).margin }

    it 'should fetch the html body from reuters.com' do
      expect(HTTParty).to receive(:get).with('http://www.reuters.com/')
      subject
    end

    it 'should count only `a` from the html body'
    it 'should return occurence of `a` divided by 100'
  end
end
