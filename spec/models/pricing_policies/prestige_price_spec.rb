require 'rails_helper'
require 'nokogiri'

# TODO: use webmock
http_body = %Q(
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <pubDate>Thu, 13 Oct 2016 14:24:01 +0100</pubDate>
  <pubDate>Thu, 13 Oct 2016 14:24:01 +0100</pubDate>
</rss>
)

document = Nokogiri::HTML(http_body).css('pubDate')

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

    it 'should count only `pubDate` tag from the html body' do
      allow_any_instance_of(PricingPolicy::PrestigePrice).to receive(:fetch).and_return(document)
      expect(document).to receive(:count).and_return(2)
      subject
    end

    it 'should return occurence of `<pubDate>`' do
      expect(subject.margin).to eq(2)
    end
  end

  # instance variables
  describe :total_price do
    subject { pricing_policy.total_price }
    it 'should calculate by base_price + margin' do
      expect(subject).to eq(102)
    end
  end
end
