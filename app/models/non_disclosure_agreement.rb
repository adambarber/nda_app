class NonDisclosureAgreement < ActiveRecord::Base
  validates :name, :body, presence: true
end
