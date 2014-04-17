require 'spec_helper'

describe ChecksController do

  describe "GET 'checkin'" do
    it "returns http success" do
      get 'checkin'
      response.should be_success
    end
  end

  describe "GET 'checkout'" do
    it "returns http success" do
      get 'checkout'
      response.should be_success
    end
  end

end
