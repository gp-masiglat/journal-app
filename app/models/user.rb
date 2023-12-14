class User < ApplicationRecord
    has_secure_password
    has_many :categories, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :password_digest, length: { minimum: 6 }
end
