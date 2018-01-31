class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category, optional: true
  validates_presence_of :name
  
  mount_uploader :image, PhotoUploader
  scope :recent_ten, -> { order(created_at: :desc).limit(10) }
end
