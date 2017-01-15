require 'nokogiri'

class PricingPolicy::PrestigePrice < PricingPolicy::Price

  # NOTE: allowing margin in attr_reader for testing
  attr_reader :margin, :total_price

  def initialize(base_price)
    @base_uri = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'
    @margin = get_margin
    @total_price = @margin + base_price
  end

  protected
  def re_format(response)
    document = Nokogiri::XML(response)
    document.css('pubDate')
  end

  def get_margin
    fetch.count
  end
end
