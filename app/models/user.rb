class User < ApplicationRecord

	has_secure_password
  
	attr_accessor  :password_confirmation

	validates :name, :email, :password, :password_confirmation, presence: true
	
	validates :name, :email, uniqueness: { case_sensitive: false }

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

end
