require 'nokogiri'

class PricingPolicy::FlexiblePrice < PricingPolicy::Price

  # NOTE: allowing margin in attr_reader for testing
  attr_reader :margin, :total_price

  def initialize(base_price)
    @base_uri = 'http://www.reuters.com/'
    @margin = get_margin
    @total_price = @margin * base_price
  end

  private
  def re_format(response)
    collect_text(Nokogiri::HTML(response))
  end

  def get_margin
    fetch.count('a') / 100.00
  end
end
