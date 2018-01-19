class User < ApplicationRecord
  has_secure_password
<<<<<<< HEAD

  validates :username, presence: true, uniqueness: true
=======
  belongs_to :room

>>>>>>> chris/rails-backend
end
