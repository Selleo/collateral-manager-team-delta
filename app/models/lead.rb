class Lead < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :tags, through => :lead_tags
  has_many :lead_tags
end
