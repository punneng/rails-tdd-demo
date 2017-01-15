require 'net/http'

class PricingPolicy::FixedPrice

  @@base_uri = 'http://www.reuters.com/'

  def initialize(base_price)
    @base_price = base_price
  end

  def margin
    response = HTTParty.get(@@base_uri)
  end
end
