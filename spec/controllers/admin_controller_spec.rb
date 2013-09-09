require 'spec_helper'

describe AdminController do
  include Devise::TestHelpers

  let(:mock_user) { mock_model(User) }
  before(:each) do
    @nda = FactoryGirl.create(:non_disclosure_agreement, {name: "Test", body: "Some Body"})
    @signature = FactoryGirl.create(:signature, {name: "Some Name", non_disclosure_agreement_id: @nda.id})
    request.env['warden'] = double(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end

  describe "GET 'index'" do
    describe "response" do
      it "returns http success" do
        get 'index'
        expect(response).to be_success
      end
      it "assigns signatures" do
        get :index
        assigns(:signatures).should match_array([@signature])
      end
    end
    describe "views" do
      render_views
      it "should use the admin layout" do
        get 'index'
        expect(response).to render_template 'layouts/admin'
      end
      it "has the correct title" do
        get 'index'
        expect(response.body).to have_content "Signatures"
      end
      it "shows one signature" do
        get 'index'
        expect(response.body).to have_content @signature.id
        expect(response.body).to have_content @signature.name
        expect(response.body).to have_content @signature.non_disclosure_agreement_name
      end
      it "shows many signatures" do
        signature2 = FactoryGirl.create(:signature, {name: "Larry Smith", non_disclosure_agreement_id: @nda.id})
        signature2.non_disclosure_agreement_id = @nda.id

        get 'index'
        expect(response.body).to have_content @signature.name
        expect(response.body).to have_content signature2.name
      end
      it "should link to signatures" do
        get 'index'
        expect(response.body).to have_link "Signatures"
      end
      it "should link to non disclosure index" do
        get 'index'
        expect(response.body).to have_content "Non-Disclosure Agreements"
      end
    end
  end

  describe "GET 'settings'" do
    describe "response" do
      it "returns http success" do
        get 'settings'
        response.should be_success
      end
    end

    describe "views" do
      render_views
      it "renders sidebar boxes" do
        get 'settings'
        expect(response.body).to have_content "About Application Settings"
        expect(response.body).to have_content "Changing Application Settings on Heroku"
      end
      it "renders settings table" do
        get 'settings'
        expect(response.body).to have_selector "table#settings_table"
      end
      it "renders the correct page title" do
        get 'settings'
        expect(response.body).to have_selector "h1", text: "Application Settings"
      end
    end
  end
end