class Tag < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true
end
