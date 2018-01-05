class User < ApplicationRecord
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def admin?
    self.role == "admin"
  end
end
