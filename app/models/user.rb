class User < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :email, uniqueness: {case_sensitive: false}, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password, length: {minimum: 8}
  has_many :problems
  has_many :solutions
end
