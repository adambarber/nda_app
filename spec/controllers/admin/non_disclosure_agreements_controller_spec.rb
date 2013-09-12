require 'spec_helper'

describe Admin::NonDisclosureAgreementsController do
  let(:non_disclosure_agreement) { NonDisclosureAgreement.create(name: "First NDA", body: "This is the text of an NDA") }
  let(:mock_user) { stub_model(User) }

  before(:each) do
    request.env['warden'] = double(Warden, :authenticate => mock_user, :authenticate! => mock_user)
    non_disclosure_agreement
  end

  describe "GET 'index'" do
    describe 'response' do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
      it "assigns @ndas" do
        get 'index'
        expect(assigns(:ndas)).to eq([non_disclosure_agreement])
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
        get 'show', id: non_disclosure_agreement
        expect(response).to be_success
      end
      it "assigns @nda" do
        get 'edit', id: non_disclosure_agreement
        expect(assigns(:nda)).to eq(non_disclosure_agreement)
      end
    end
    describe 'views' do
      render_views
      it 'shows NDA name' do
        get 'show', id: non_disclosure_agreement
        expect(response.body).to have_content(non_disclosure_agreement.name)
      end
      it "shows content of NDA" do
        get 'show', id: non_disclosure_agreement
        expect(response.body).to have_content "NDA Text"
      end
    end
  end

  describe "Get 'edit'" do
    describe 'requests' do
      it "returns http success" do
        get 'edit', id: non_disclosure_agreement
        response.should be_success
      end
      it "assigns @nda" do
        get 'edit', id: non_disclosure_agreement
        expect(assigns(:nda)).to eq(non_disclosure_agreement)
      end
    end
    describe 'views' do
      render_views
      it 'shows edit form' do
        get 'edit', id: non_disclosure_agreement
        expect(response.body).to have_selector('form')
      end
    end
  end

  describe "Put 'update" do
    describe 'requests' do
      it "should update the object's attributes" do
        put :update, id: non_disclosure_agreement.id, non_disclosure_agreement: { name: "new name", body: "new body text"}
        non_disclosure_agreement.reload
        expect(non_disclosure_agreement.name).to eq "new name"
      end
    end
  end

  describe "Get 'new'" do
    describe 'requests' do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
      it "assigns @ndas" do
        get 'new'
        expect(assigns(:nda)).to_not be_nil
      end
    end
    describe 'views' do
      render_views
      it "should have 'new nda' title" do
        get 'new'
        expect(response.body).to have_selector("h1", text: "Add A New NDA")
      end
      it "should have a new nda form" do
        get 'new'
        expect(response.body).to have_selector('form')
      end
    end
  end

  describe "Post 'create'" do
    describe 'response' do
      it "returns http success" do
        expect {
          post 'create', {non_disclosure_agreement: { name: "new name", body: "new body text" }}
        }.to change(NonDisclosureAgreement, :count).by(1)
      end
    end
  end

end
