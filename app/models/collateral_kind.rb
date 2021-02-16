class CollateralKind < ApplicationRecord
  has_many :collaterals
  validates :name, presence: true
  validates :color, presence: true
end
