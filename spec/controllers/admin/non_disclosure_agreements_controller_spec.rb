require 'spec_helper'

describe Admin::NonDisclosureAgreementsController do
  describe "GET 'index'" do

    let(:non_disclosure_agreement) { stub_model(NonDisclosureAgreement) }
    before(:each) do
      @nda = NonDisclosureAgreement.create(name: "First NDA", body: "This is the text of an NDA")
    end

    describe 'response' do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
      it "assigns @ndas" do
        get 'index'
        expect(assigns(:ndas)).to eq([@nda])
      end
    end
    describe "views" do
      render_views
      it "should use the admin layout" do
        get 'index'
        expect(response).to render_template 'layouts/admin'
      end
      it "should display page title" do
        get 'index'
        expect(response.body).to have_selector("h1", text:"Non-Disclosure Agreements")
      end
      it "should display NDAs table" do
        get 'index'
        expect(response.body).to have_css("table#ndas_table")
      end
    end
  end

  describe "Get 'show'" do

    let(:non_disclosure_agreement) { stub_model(NonDisclosureAgreement) }
    before(:each) do
      @nda = NonDisclosureAgreement.create(name: "First NDA", body: "This is the text of an NDA")
    end

    describe 'response' do
      it 'returns http success' do
        get 'show', id: @nda
        expect(response).to be_success
      end
    end

    describe 'views' do
      render_views
      it 'should show NDA name' do
        get 'show', id: @nda
        expect(response.body).to have_content(@nda.name)
      end
    end
  end
end
