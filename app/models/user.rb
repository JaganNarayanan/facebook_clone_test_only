class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, :length => {:within => 6..20}
  has_secure_password
  has_many :statuses, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :password_confirmation, presence: true

  

end
