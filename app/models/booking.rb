class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  has_one_attached :photo
end
