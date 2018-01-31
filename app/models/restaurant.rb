class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  belongs_to :category, optional: true
  validates_presence_of :name
  
  mount_uploader :image, PhotoUploader
  scope :recent_ten, -> { order(created_at: :desc).limit(10) }

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

  def is_liked?(user)
    self.liked_users.include?(user)
  end
end
