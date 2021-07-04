class Collateral < ApplicationRecord
  validates :name, presence: true

  belongs_to :collateral_kind
  has_many :collateral_tags, :dependent => :destroy
  has_many :tags, through: :collateral_tags

  accepts_nested_attributes_for :collateral_tags, allow_destroy: true
end
