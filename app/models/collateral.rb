class Collateral < ApplicationRecord
  belongs_to :collateral_kind, class_name: "CollateralKind", foreign_key: :collateral_kinds_id
  validates :name, presence: true
end
