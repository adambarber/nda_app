class NonDisclosureAgreement < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  has_many :signatures
  validates :name, :body, presence: true

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
end
