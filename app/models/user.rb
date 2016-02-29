class User < ActiveRecord::Base
  has_secure_password
  has_many :favorite_gifs
  has_many :gifs, through: :favorite_gifs
  validates :username, presence: true, uniqueness: true
  enum role: %w(default admin)
end
