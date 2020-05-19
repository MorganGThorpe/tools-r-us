class Tool < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["Garden", "Woodwork", "Building", "General Purpose", "Warehouse", "Motorised"]

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
