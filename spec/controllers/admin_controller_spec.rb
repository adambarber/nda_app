require 'spec_helper'

describe AdminController do
  let(:signature) { stub_model(Signature) }
  before(:each) do
    @signature = Signature.create(name: "John Doe")
  end
  describe "GET 'index'" do
    describe "response" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
      it "assigns @signatures" do
        get 'index'
        expect(assigns(:signatures)).to eq([@signature])
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
      end
      it "shows many signatures" do
        @signature2 = Signature.create(name: "Larry Smith")
        get 'index'
        expect(response.body).to have_content @signature.id
        expect(response.body).to have_content @signature2.id
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
end
