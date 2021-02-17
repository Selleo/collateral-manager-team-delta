class Lead < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :lead_tags

  accepts_nested_attributes_for :lead_tags
end
