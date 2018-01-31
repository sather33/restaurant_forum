class Comment < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user

    scope :recent_ten, -> { order(created_at: :desc).limit(10) }
end
