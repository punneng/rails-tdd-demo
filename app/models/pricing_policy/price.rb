class PricingPolicy::Price

  protected
  def fetch
    response = HTTParty.get(@base_uri)
    re_format(response)
  end

  def re_format(response)
    response
  end

  def collect_text(document)
    document.css('script, link').each { |node| node.remove }
    document.css('body').text.squeeze(" \n")
  end
end
