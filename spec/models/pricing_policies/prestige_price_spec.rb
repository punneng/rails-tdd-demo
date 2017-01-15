require 'rails_helper'

# TODO: use webmock
http_body = %Q(
<pubDate>Thu, 13 Oct 2016 14:24:01 +0100</pubDate>
<pubDate>Thu, 13 Oct 2016 14:24:01 +0100</pubDate>
)
RSpec.describe PricingPolicy::PrestigePrice do
  let(:pricing_policy) { PricingPolicy::PrestigePrice.new(100) }

  before do
    allow(HTTParty).to receive(:get)
                       .with('http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
                       .and_return(http_body)
  end

  # class methods
  describe '.new' do
    subject { pricing_policy }

    it 'should fetch the html body from yourlocalguardian.co.uk' do
      expect(HTTParty).to receive(:get).with('http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
      subject
    end
  end
end
