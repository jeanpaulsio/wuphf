# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  phone = "9496405333"
  twitter_handle = "wuphfwuphf"
  user_id = User.first.id

  Recipient.create!(name: name,
                    email: email,
                    phone: phone,
                    twitter_handle:
                    twitter_handle,
                    user_id: user_id)
end
