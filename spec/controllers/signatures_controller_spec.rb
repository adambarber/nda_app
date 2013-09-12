require 'spec_helper'

describe SignaturesController do

  describe "GET 'index'" do
    let(:nda) { FactoryGirl.create(:non_disclosure_agreement, name: "My Awesome Non Disclosure Agreement", body: "This is some awesome text of a really great non-disclosure agreement.") }

    before(:each) do
      nda
    end

    describe 'requests' do |variable|
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

    describe 'views' do
      render_views
      it 'renders signature submit button' do
        @signature = FactoryGirl.build(:signature, non_disclosure_agreement: nda)
        get 'index'
        expect(response.body).to have_button "Submit Document Signature"
      end

      it 'shows the non disclosure agreement' do
        get 'index'
        expect(response.body).to have_content nda.body
      end
    end
  end

end
