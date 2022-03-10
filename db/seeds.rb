puts "creating fake users"
default_password = "123456"
owner = User.create!(
  email: "owner@user.com",
  password: default_password,
  address: "Alvaro Obregon 213"
)
customer_1 = User.create!(email: "customer@user.com", password: default_password)
customer_2 = User.create!(email: "customer2@user.com", password: default_password)
customers = [customer_1, customer_2]
puts "done!"

gadget_names = ["Food Processor", "Knives", "Tongs", "Frying Pan", "Dutch Oven", "Stockpot",
                "Citrus Juicer", "Espresso Machine",
                "French Press", "Mandoline Slicer", "Percolator", "Pizza Slicer",
                "Stand Mixer", "Toaster Oven", "Whisk", "Wok"]
puts "creating #{gadget_names.count} fake gadgets"
gadgets = gadget_names.map do |gadget_name|
  file = File.open("db/support/#{gadget_name.parameterize}.jpg")
  gadget = Gadget.new(
    name: gadget_name,
    description: Faker::Lorem.sentence(word_count: rand(5..20)),
    owner: owner
  )
  gadget.photo.attach(io: file, filename: "#{gadget_name.parameterize}.jpg", content_type: 'image/jpg')
  gadget.save!

  gadget.update_columns(
    latitude: rand(19.4108923..19.416905),
    longitude: rand(-99.1720769..-99.1606911)
  )
  gadget
end
gadgets.first.update(description: "This high-quality food processor is a versatile kitchen tool.
                      Use it to chop, grate, or blend. A must-have when cooking for a crowd.")
puts "done!"

puts "creating 10 fake bookings"
10.times do
  booking = Booking.create!(
    start_on: Faker::Date.between(from: '2021-03-01', to: '2021-03-31'),
    end_on: Faker::Date.between(from: '2021-04-01', to: '2021-04-30'),
    gadget: gadgets.sample,
    customer: customers.sample,
  )
  booking.save!
end
puts "done"
