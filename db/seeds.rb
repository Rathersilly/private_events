# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

10.times do |i|
  user = User.create!(name: Faker::Name.first_name,
               email: "example#{i+1}@example.com",
               password: "asdf",
               password_confirmation: "asdf")
end
User.all.each do |user|
  event = user.events.create(name: "#{Faker::Music.genre} concert",
                     place: "Somewhere in space",
                     time: DateTime.now)
  user = event.host
  3.times do |j|
    Invitation.create(invitee_id: User.all.reject{ |x| x.id == user.id }.sample.id,
                      event_id: event.id,
                      host_id: user.id,
                      accepted: rand(2) == 1 ? true : false)
  end
end
user = User.create!(name: "asdf",
             email: "asdf",
             password: "asdf",
             password_confirmation: "asdf")
event = user.events.create(name: "Heaven",
                   place: "Beyond the 7-11",
                   time: DateTime.now)

5.times do |i|
  Invitation.create(invitee_id: User.all.reject{ |x| x.id == user.id }.sample.id,
                      event_id: event.id,
                      host_id: user.id,
                      accepted: rand(2) == 1 ? true : false)
end
