class CollateralTag < ApplicationRecord
  validates :collateral_id, presence: true
  validates :tag_id, presence: true
  validates :weight, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }
end
