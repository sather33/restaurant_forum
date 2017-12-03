class Restaurant < ApplicationRecord
  belongs_to :category, optional: true
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
end
