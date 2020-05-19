class Tool < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["Garden", "Woodwork", "Building", "General Purpose", "Warehouse", "Motorised"]
end
