class CollateralTag < ApplicationRecord
  validates :weight, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }

  belongs_to :tag
  belongs_to :collateral
end
