class Tool < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["Garden", "Woodwork", "Building", "General Purpose", "Warehouse", "Motorised"]

  vaidates :name, presence: true
  vaidates :description, presence: true
  vaidates :price, presence: true
  vaidates :categories, inclusion: { in: CATEGORIES }
end
