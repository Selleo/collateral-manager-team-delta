class LeadTag < ApplicationRecord
  validates :lead_id, presence: true
  validates :tag_id, presence: true
  validates :position, numericality: { only_integer: true }
  belongs_to :lead
  belong_to :tag
end