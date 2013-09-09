require 'spec_helper'

describe NonDisclosureAgreement do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }
end
