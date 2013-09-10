class Signature < ActiveRecord::Base
  belongs_to :non_disclosure_agreement
  validates :name, :non_disclosure_agreement, presence: true
  delegate :name, to: :non_disclosure_agreement, prefix: true

  def display_created_at
    created_at.strftime('%m/%d/%Y')
  end
end
