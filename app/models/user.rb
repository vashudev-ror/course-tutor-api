class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX, message: :invalid },
            length: { maximum: 255 }

  validates :password,
            presence: true,
            length: { minimum: 6 },
            allow_nil: true # allows update without forcing password
end
