require 'rails_helper'

# TODO: use webmock
http_body = %Q(
<strong>Status</strong> status <pre>Status</pre>
)
http_body_tokens = ActionView::Base.full_sanitizer.sanitize(http_body)
RSpec.describe PricingPolicy::FixedPrice do
  let(:pricing_policy) { PricingPolicy::FixedPrice.new(100) }
  before do
    allow(HTTParty).to receive(:get)
                       .with('https://developer.github.com/v3/#http-redirects')
                       .and_return(http_body)
  end

  # class methods
  describe '.new' do
    subject { pricing_policy }

    it 'should fetch the html body from developer.github.com' do
      expect(HTTParty).to receive(:get).with('https://developer.github.com/v3/#http-redirects')
      subject
    end

    it 'should count only `status` and `Status` from the html body' do
      allow_any_instance_of(PricingPolicy::FixedPrice).to receive(:fetch).and_return(http_body)
      allow(http_body).to receive(:split).and_return(http_body_tokens)
      expect(http_body_tokens).to receive(:count).with('status').and_return(1)
      expect(http_body_tokens).to receive(:count).with('Status').and_return(2)
      subject
    end

    it 'should return occurence of `status`' do
      expect(subject.margin).to eq(3)
    end
  end

  # instance variables
  describe :total_price do
    subject { pricing_policy.total_price }
    it 'should calculate by base_price + margin' do
      expect(subject).to eq(103)
    end
  end
end
