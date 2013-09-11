require 'spec_helper'

describe SignaturesController do

  describe "GET 'index'" do

    it "returns http success" do
      @nda = FactoryGirl.create(:non_disclosure_agreement, {name: "Test", body: "Some Body"})
      get 'index'
      response.should be_success
    end
  end

end
