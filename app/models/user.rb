class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 7, maximum: 105 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
