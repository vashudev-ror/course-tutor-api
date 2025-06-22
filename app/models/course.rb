class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }, allow_blank: true
  accepts_nested_attributes_for :tutors
end
