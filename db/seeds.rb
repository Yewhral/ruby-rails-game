# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "user@example.com",
             password: "test1234",
             password_confirmation: "test1234",
             admin: true)

4.times do |n|
  name  = Faker::Name.name
  email = "admin#{n+1}@example.com"
  password = "admin#{n+1}"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: true)
end

20.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@example.com"
  password = "password#{n+1}"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end
