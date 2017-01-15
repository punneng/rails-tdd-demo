require 'net/http'
require 'nokogiri'

class PricingPolicy::FixedPrice

  # NOTE: allowing margin in attr_reader for testing
  attr_reader :margin, :total_price

  @@base_uri = 'https://developer.github.com/v3/#http-redirects'

  def initialize(base_price)
    @margin = get_margin
    @total_price = @margin + base_price
  end

  private
  # TODO: move fetch to a super class
  def fetch
    response = HTTParty.get(@@base_uri)
    document = Nokogiri::HTML(response)
    document.css('script, link').each { |node| node.remove }
    document.css('body').text.squeeze(" \n")
  end

  def get_margin
    tokens = fetch.split
    tokens.count('status') + tokens.count('Status')
  end
end
