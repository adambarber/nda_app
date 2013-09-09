require 'spec_helper'

describe Signature do
  it { should validate_presence_of(:name) }
end
