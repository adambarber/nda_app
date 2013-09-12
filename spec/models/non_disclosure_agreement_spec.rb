require 'spec_helper'

describe NonDisclosureAgreement do
  let(:nda) { FactoryGirl.create(:non_disclosure_agreement) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }
  it { should have_many(:signatures) }

  before(:each) do
    nda
  end

  it "should display a pretty date" do
    expect(nda.display_created_at).to eql nda.created_at.strftime('%m/%d/%Y')
  end

  it "should display last time updated as relative time" do
    expect(nda.last_updated_at).to eql time_ago_in_words(nda.updated_at)
  end

  it "should format markdown" do
    expect(nda.formatted_body).to eql "<p>MyText</p>\n"
  end

  it "should not be active by default" do
    expect(nda.active?).to eql false
  end

  it "should be able to toggle active to true" do
    nda.make_active!
    expect(nda.active?).to eql true
  end

  it "should be able to toggle active to true" do
    nda.make_active!
    nda.make_active!
    expect(nda.active?).to eql false
  end

  it "should be primary if there are no other ndas" do
    expect(nda.primary_nda?).to eql true
  end

  it "should not be primary if there are already ndas" do
    nda2 = FactoryGirl.create(:non_disclosure_agreement)
    expect(nda2.primary_nda?).to eql false
  end

  it "should be able to select a different nda to be the only primary" do
    nda2 = FactoryGirl.create(:non_disclosure_agreement)
    nda2.make_primary!
    expect(nda.primary_nda?).to eql true
  end
end
