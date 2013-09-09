require 'spec_helper'

describe Admin::NonDisclosureAgreementsController do
  let(:non_disclosure_agreement) { stub_model(NonDisclosureAgreement) }
  before(:each) do
    @nda = NonDisclosureAgreement.create(name: "First NDA", body: "This is the text of an NDA")
  end

  describe "GET 'index'" do
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
    describe 'response' do
      it 'returns http success' do
        get 'show', id: @nda
        expect(response).to be_success
      end
      it "assigns @nda" do
        get 'edit', id: @nda
        expect(assigns(:nda)).to eq(@nda)
      end
    end
    describe 'views' do
      render_views
      it 'should show NDA name' do
        get 'show', id: @nda.id
        expect(response.body).to have_content(@nda.name)
      end
    end
  end

  describe "Get 'edit'" do
    describe 'requests' do
      it "returns http success" do
        get 'edit', id: @nda
        response.should be_success
      end
      it "assigns @nda" do
        get 'edit', id: @nda
        expect(assigns(:nda)).to eq(@nda)
      end
    end
    describe 'views' do
      render_views
      it 'shows edit form' do
        get 'edit', id: @nda
        expect(response.body).to have_selector('form')
      end
    end
  end

  describe "Put 'update" do
    describe 'requests' do
      it "should update the object's attributes" do
        put :update, id: @nda.id, non_disclosure_agreement: { name: "new name", body: "new body text"}
        @nda.reload
        expect(@nda.name).to eq "new name"
      end
    end
  end
end
