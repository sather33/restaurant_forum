class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  belongs_to :category, optional: true
  validates_presence_of :name
  
  mount_uploader :image, PhotoUploader
  scope :recent_ten, -> { order(created_at: :desc).limit(10) }
end
