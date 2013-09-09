require 'spec_helper'

describe Signature do
  it { should validate_presence_of(:name) }

  it "should access non_disclosure_agreement_name" do
    nda = stub_model(NonDisclosureAgreement, name: "Test", body: "Some Body")
    signature = stub_model(Signature, name: "Some Name")
    signature.non_disclosure_agreement = nda
    expect(signature.non_disclosure_agreement_name).to eql nda.name
  end
end
