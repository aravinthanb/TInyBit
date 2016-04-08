class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username
  validates :username,  presence: true, length: { maximum: 15 }
  has_many :posts, dependent: :destroy

end
