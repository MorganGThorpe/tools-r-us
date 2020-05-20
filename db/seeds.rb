# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  Booking.destroy_all
  Tool.destroy_all
end

grill = Tool.create(name: "Grill", description: "Great for a sunny bbq", price_per_day: 20, category: "Garden", user: User.first)
hammer = Tool.create(name: "Hammer", description: "Heavy tool for strong men", price_per_day: 5, category: "Garden", user: User.last)
shovel = Tool.create(name: "Shovel", description: "Plant anything with a big shovel", price_per_day: 3, category: "Garden", user: User.first)
gloves = Tool.create(name: "Gloves", description: "Keep your hands clean with premium gloves", price_per_day: 2, category: "Garden", user: User.last)
Booking.create!(booking_cost: 10, start_date: Date.today, end_date: Date.today + 2.days, user: User.first, tool: hammer)
Booking.create!(booking_cost: 5, start_date: Date.today, end_date: Date.today + 3.days, user: User.first, tool: gloves)
Booking.create!(booking_cost: 5, start_date: Date.today, end_date: Date.today + 4.days, user: User.last, tool: grill)
Booking.create!(booking_cost: 5, start_date: Date.today, end_date: Date.today + 5.days, user: User.last, tool: shovel)

