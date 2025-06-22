class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX, message: :invalid },
            length: { maximum: 255 }

  validates :password,
            presence: true,
            length: { minimum: 6 },
            allow_nil: true # allows update without forcing password
end
