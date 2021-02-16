class Collateral < ApplicationRecord
  belongs_to :collateral_kind
  validates :name, presence: true
end
