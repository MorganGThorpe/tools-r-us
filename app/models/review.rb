class Review < ApplicationRecord
  belongs_to :tool

  RATINGS = [1, 2, 3, 4, 5]

  validates :content, presence: true
  validates :rating, inclusion: { in: RATINGS}
end
