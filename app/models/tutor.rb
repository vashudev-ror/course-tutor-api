class Tutor < ApplicationRecord
  belongs_to :course

  validates :first_name, :last_name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: User::VALID_EMAIL_REGEX, message: :invalid },
            length: { maximum: 255 }
end
