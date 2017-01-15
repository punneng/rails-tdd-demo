require 'net/http'
require 'nokogiri'

class PricingPolicy::PrestigePrice

  # NOTE: allowing margin in attr_reader for testing
  attr_reader :margin, :total_price

  @@base_uri = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'

  def initialize(base_price)
    get_margin
  end

  private
  # TODO: move fetch to a super class
  def fetch
    response = HTTParty.get(@@base_uri)
    document = Nokogiri::HTML(response)
    clean_tags(document)
  end

  def clean_tags(document)
    document
  end

  def get_margin
    fetch
  end
end
