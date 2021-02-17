class CollateralKind < ApplicationRecord
  has_many :collaterals, :dependent => :destroy
  validates :name, presence: true
  validates :color, presence: true
end
