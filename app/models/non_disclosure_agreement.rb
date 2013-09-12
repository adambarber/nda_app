class NonDisclosureAgreement < ActiveRecord::Base
  scope :primary, -> { where("primary_nda = true") }

  include ActionView::Helpers::DateHelper
  has_many :signatures
  validates :name, :body, presence: true

  before_create :check_for_and_make_primary

  def display_created_at
    created_at.strftime('%m/%d/%Y')
  end

  def last_updated_at
    time_ago_in_words self.updated_at
  end

  def formatted_body
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    (markdown.render body).html_safe
  end

  def make_primary!
    self.class.update_all(primary_nda: false)
    self.update_attributes(primary_nda: true)
  end

  def make_active!
    self.toggle!(:active)
  end

  private

  def check_for_and_make_primary
    if self.class.primary.empty?
      self.primary_nda = true
    end
    return true
  end

end
