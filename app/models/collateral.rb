class Collateral < ApplicationRecord
  validates :name, presence: true

  belongs_to :collateral_kind
  has_many :collateral_tags
  has_many :tags, through: :collateral_tags
end
