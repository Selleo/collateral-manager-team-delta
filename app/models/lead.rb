class Lead < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :lead_tags, :dependent => :destroy
  has_many :tags, through: :lead_tags

  accepts_nested_attributes_for :lead_tags, allow_destroy: true
end
