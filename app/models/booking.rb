class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  def booking_cost
    if self.start_date && self.end_date
      (self.end_date - self.start_date).to_f * self.tool.price_per_day
    else
      0
    end
  end
end
