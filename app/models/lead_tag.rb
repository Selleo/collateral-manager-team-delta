class LeadTag < ApplicationRecord
  validates :position, numericality: { only_integer: true }
  belongs_to :lead
  belongs_to :tag
end
