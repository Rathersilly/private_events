# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  user = User.create!(name: Faker::Name.first_name,
               email: "example#{i+1}@example.com",
               password: "asdf",
               password_confirmation: "asdf")
  user.events.create(name: "#{Faker::Music.genre} concert",
                     place: "Somewhere in space",
                     time: DateTime.now)
end

