# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = 10.times.map do
  User.create email: Faker::Internet.email, password: Faker::Internet.password
end

states = Task.aasm.states

20.times do
  Task.create(
    name: Faker::Company.buzzword,
    description: Faker::Company.catch_phrase,
    user: users.sample,
    state: states.sample
  )
end
