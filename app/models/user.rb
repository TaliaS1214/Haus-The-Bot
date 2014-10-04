class User < ActiveRecord::Base

  belongs_to :house

  validates :handle, uniqueness: true

  has_secure_password
  
end
