require 'net/http'
require 'nokogiri'

class PricingPolicy::FlexiblePrice

  # NOTE: allowing margin in attr_reader for testing
  attr_reader :margin, :total_price

  @@base_uri = 'http://www.reuters.com/'

  def initialize(base_price)
    @margin = get_margin
    @total_price = @margin * base_price
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
    fetch.count('a') / 100.00
  end
end
