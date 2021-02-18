class Lead < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :tags, through => :lead_tags
  has_many :lead_tags
<<<<<<< HEAD
=======

  accepts_nested_attributes_for :lead_tags
>>>>>>> 99ada2c8ab77abaf22ce065c2fea39af5772843d
end
