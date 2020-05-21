class Tool < ApplicationRecord
  belongs_to :user
  has_many :review

  CATEGORIES = ["Garden", "Woodwork", "Building", "General Purpose", "Warehouse", "Motorised"]
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
