require 'rails_helper'

http_body = %Q(
<table>
  <thead>
    <tr>
      <th>Status Code</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>301</code></td>
      <td>Permanent redirection. The URI you used to make the request has been superseded by the one specified in the <code>Location</code> header field. This and all future requests to this resource should be directed to the new URI.</td>
    </tr>
    <tr>
      <td><code>302</code>, <code>307</code></td>
      <td>Temporary redirection. The request should be repeated verbatim to the URI specified in the <code>Location</code> header field but clients should continue to use the original URI for future requests.</td>
    </tr>
    </tbody>
</table>
)
RSpec.describe PricingPolicy::FixedPrice do
  let(:pricing_policy) { PricingPolicy::FixedPrice.new(100) }
  before do
    allow(HTTParty).to receive(:get)
                       .with('https://developer.github.com/v3/#http-redirects')
                       .and_return(http_body)
  end

  # class methods
  describe '.new' do
    subject { pricing_policy }

    it 'should fetch the html body from reuters.com' do
      expect(HTTParty).to receive(:get).with('https://developer.github.com/v3/#http-redirects')
      subject
    end
  end

  # instance variables
  describe :total_price
end
