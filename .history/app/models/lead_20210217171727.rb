class Lead < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates: :lead_tag
end
