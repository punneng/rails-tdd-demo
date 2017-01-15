require 'nokogiri'

class PricingPolicy::FixedPrice < PricingPolicy::Price

  # NOTE: allowing margin in attr_reader for testing
  attr_reader :margin, :total_price

  def initialize(base_price)
    @base_uri = 'https://developer.github.com/v3/#http-redirects'
    @margin = get_margin
    @total_price = @margin + base_price
  end

  private
  def re_format(response)
    collect_text(Nokogiri::HTML(response))
  end

  def get_margin
    tokens = fetch.split
    tokens.count('status') + tokens.count('Status')
  end
end
