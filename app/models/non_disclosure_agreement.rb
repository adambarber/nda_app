class NonDisclosureAgreement < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  validates :name, :body, presence: true

  def display_created_at
    created_at.strftime('%m/%d/%Y')
  end

  def last_updated_at
    time_ago_in_words self.updated_at
  end
end
