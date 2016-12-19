class User < ApplicationRecord
  has_secure_password
  has_many :ideas
  has_many :likes
  has_many :ideas_liked, through: :likes, source: :idea
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :password, presence:true
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

end
