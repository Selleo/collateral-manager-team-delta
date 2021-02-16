class Collateral < ApplicationRecord
  validates :name, presence: true

  belongs_to :collateral_kind
  has_many :collateral_tags
end
