class Review < ApplicationRecord
  belongs_to :tool

  validates :rating, presence: true
end
