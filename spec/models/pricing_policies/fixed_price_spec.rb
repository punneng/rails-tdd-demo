require 'rails_helper'

readable_http_body = %q(
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lectus est,
  gravida a nibh non, tincidunt sodales nibh. Proin nibh massa, porta quis egestas at,
  maximus vitae dui. Morbi vitae elementum mi. In ullamcorper nunc ac eleifend consequat.
  Suspendisse dignissim ornare porttitor. Cras lobortis velit ornare lorem placerat,
  quis tempus.
)

RSpec.describe PricingPolicy::FixedPrice do
  let(:pricing_policy) { PricingPolicy::FixedPrice.new(100) }
  before do
    allow(HTTParty).to receive(:get)
                       .with('http://www.reuters.com/')
                       .and_return("<a>#{readable_http_body}</a>")
  end

  describe 'new' do
    subject { pricing_policy }

    it 'should fetch the html body from reuters.com' do
      expect(HTTParty).to receive(:get).with('http://www.reuters.com/')
      subject
    end

    it 'should count only `a` from the html body' do
      allow_any_instance_of(PricingPolicy::FixedPrice).to receive(:fetch).and_return(readable_http_body)
      expect(readable_http_body).to receive(:count).with('a')
      subject
    end

    it 'should return occurence of `a` divided by 100'
  end
end
