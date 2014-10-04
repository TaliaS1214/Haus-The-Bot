class User < ActiveRecord::Base
  has_secure_password
  belongs_to :house
  validates :handle, :password, presence: true
  validates :handle, uniqueness: true, :case_sensitive => false
end
