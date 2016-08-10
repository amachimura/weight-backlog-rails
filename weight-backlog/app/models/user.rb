class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence:true, length: {maximum: 50},
  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: {case_sensitive: false}
  validates :weight, length: {maximum: 5}
  validates :password, length: {minimum: 6}
  has_secure_password
end
