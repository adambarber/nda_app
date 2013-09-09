class Signature < ActiveRecord::Base
  validates :name, presence: true
end
