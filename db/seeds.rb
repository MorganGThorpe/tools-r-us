# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

if Rails.env.development?
  Booking.destroy_all
  Tool.destroy_all
end


Tool.create(
    name: 'Garden Hoe', 
    description: 'This is a lovely garden hoe that I use to hoe my garden.', 
    price_per_day: 5.55,  
    user: User.last,
    category: "Garden"
)
