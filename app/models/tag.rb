class Tag < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true

  has_many :collateral_tags
end
