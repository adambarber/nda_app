require 'spec_helper'

describe SignaturesController do

  describe "GET 'index'" do
    describe 'requests' do |variable|
      it "returns http success" do
        @nda = FactoryGirl.create(:non_disclosure_agreement, {name: "Test", body: "Some Body"})
        get 'index'
        response.should be_success
      end
    end

    describe 'views' do
      render_views
      it 'renders signature submit button' do
        @nda = FactoryGirl.create(:non_disclosure_agreement, {name: "Test", body: "Some Body"})
        @signature = FactoryGirl.build(:signature, non_disclosure_agreement: @nda)
        get 'index'
        expect(response.body).to have_button "Submit Document Signature"
      end

      it 'shows the non disclosure agreement' do
        @nda = FactoryGirl.create(:non_disclosure_agreement, {name: "My Awesome Non Disclosure Agreement", body: "Some Body"})
        get 'index'
        expect(response.body).to have_content "My Awesome Non Disclosure Agreement"
      end
    end
  end

end
