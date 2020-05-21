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

pictures = []
path = Rails.root.join('app/assets/images/tools_bookings').to_s
Dir.foreach(path) do |f|
  pictures << File.join(path, f)
end
pictures = pictures.select{ |p| p.end_with?(".jpg")}
p pictures

uploaded_file = Cloudinary::Uploader.upload(pictures.sample)
grill = Tool.create(name: "Grill", description: "Great for a sunny bbq", price_per_day: 20, category: "Garden", user: User.first)
grill.update!(photo: { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' })

uploaded_file = Cloudinary::Uploader.upload(pictures.sample)
hammer = Tool.create(name: "Hammer", description: "Heavy tool for strong men", price_per_day: 5, category: "Garden", user: User.last)
hammer.update!(photo: { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' })

uploaded_file = Cloudinary::Uploader.upload(pictures.sample)
shovel = Tool.create(name: "Shovel", description: "Plant anything with a big shovel", price_per_day: 3, category: "Garden", user: User.first)
shovel.update!(photo: { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' })

uploaded_file = Cloudinary::Uploader.upload(pictures.sample)
gloves = Tool.create(name: "Gloves", description: "Keep your hands clean with premium gloves", price_per_day: 2, category: "Garden", user: User.last)
gloves.update!(photo: { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' })

uploaded_file = Cloudinary::Uploader.upload(pictures.sample)
chainsaw = Tool.create(name: "Gloves", description: "Cut big trees in no time", price_per_day: 2, category: "Garden", user: User.last)
chainsaw.update!(photo: { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' })

uploaded_file = Cloudinary::Uploader.upload(pictures.sample)
nail = Tool.create(name: "Gloves", description: "Perfect for IKEA projects", price_per_day: 2, category: "Garden", user: User.last)
nail.update!(photo: { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' })

booking1 = Booking.create!(booking_cost: 10, start_date: Date.today, end_date: Date.today + 2.days, user: User.first, tool: hammer)

booking2 = Booking.create!(booking_cost: 5, start_date: Date.today, end_date: Date.today + 3.days, user: User.first, tool: gloves)

booking3 = Booking.create!(booking_cost: 5, start_date: Date.today, end_date: Date.today + 4.days, user: User.last, tool: grill)

booking4 = Booking.create!(booking_cost: 5, start_date: Date.today, end_date: Date.today + 5.days, user: User.last, tool: shovel)

