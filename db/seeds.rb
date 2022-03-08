puts "creating fake users"
default_password = "123456"
owner = User.create!(email: "owner@user.com", password: default_password)
customer_1 = User.create!(email: "customer@user.com", password: default_password)
customer_2 = User.create!(email: "customer2@user.com", password: default_password)
customers = [customer_1, customer_2]
puts "done!"

puts "creating 15 fake gadgets"
gadgets_name = %w[knives tongs frying-pan saucepan stockpot can-opener salad-spinner]
gadgets = 15.times.map do
  Gadget.create!(
    name: gadgets_name.sample,
    description: Faker::Lorem.sentence(word_count: rand(5..20)),
    owner: owner
  )
end
puts "done!"

puts "creating 10 fake bookings"
10.times do
  booking = Booking.create!(
    start_on: Faker::Date.between(from: '2021-03-01', to: '2021-03-31'),
    end_on: Faker::Date.between(from: '2021-04-01', to: '2021-04-30'),
    gadget: gadgets.sample,
    customer: customers.sample,
  )
  booking.save
end
puts "done"
