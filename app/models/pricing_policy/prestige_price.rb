require 'nokogiri'

class PricingPolicy::PrestigePrice

  # NOTE: allowing margin in attr_reader for testing
  attr_reader :margin, :total_price

  @@base_uri = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'

  def initialize(base_price)
    @margin = get_margin
    @total_price = @margin + base_price
  end

  private
  # TODO: move fetch to a super class
  def fetch
    response = HTTParty.get(@@base_uri)
    re_format(response)
  end

  def re_format(response)
    document = Nokogiri::XML(response)
    document.css('pubDate')
  end

  def get_margin
    fetch.count
  end
end
