class User < ApplicationRecord
  has_many :events
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  
end
