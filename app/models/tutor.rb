class Tutor < ApplicationRecord
  belongs_to :course

  validates :first_name, :email, presence: true
  validates :email, uniqueness: true
end
