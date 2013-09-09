require 'spec_helper'

describe NonDisclosureAgreement do
  let(:nda) { FactoryGirl.create(:non_disclosure_agreement) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }

  it "should display a pretty date" do
    expect(nda.display_created_at).to eql nda.created_at.strftime('%m/%d/%Y')
  end

  it "should display last time updated as relative time" do
    expect(nda.last_updated_at).to eql time_ago_in_words(nda.updated_at)
  end

  it "should format markdown" do
    nda = FactoryGirl.create(:non_disclosure_agreement, body: "**This is a headline**")
    expect(nda.formatted_body).to eql "<p><strong>This is a headline</strong></p>\n"
  end
end
