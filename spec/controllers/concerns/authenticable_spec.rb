require 'rails_helper'

class Authentication < ApplicationController
  include Authenticable
end

describe Authenticable, type: :controller do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe "#current_user" do
    before do
      request.headers["Authorization"] = 'my-fake-token'
      allow(authentication).to receive(:request).and_return(request)
    end

    it "returns the user from the authorization header" do
      expect(authentication.current_user).to eql'my-fake-token'
    end
  end
end
