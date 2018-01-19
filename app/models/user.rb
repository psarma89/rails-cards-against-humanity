class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  belongs_to :room

end
