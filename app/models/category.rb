class Category < ApplicationRecord
  validates :name, presence: true
  has_many :restaurants, dependent: :destroy
end
