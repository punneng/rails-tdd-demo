require 'net/http'
require 'nokogiri'

class PricingPolicy::FixedPrice

  @@base_uri = 'http://www.reuters.com/'

  def initialize(base_price)
    @base_price = base_price
    @margin = fetch.count('a')
  end

  private
  def fetch
    response = HTTParty.get(@@base_uri)
    document = Nokogiri::HTML(response)
    document.css('script, link').each { |node| node.remove }
    document.css('body').text.squeeze(" \n")
  end
end
