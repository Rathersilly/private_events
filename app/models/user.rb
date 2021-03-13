class User < ApplicationRecord
  has_many :events, foreign_key: :host_id
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  
end
