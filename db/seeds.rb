# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'
 

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end

 users = User.all

 # Create Lists
 15.times do
   List.create!(
    user:  users.sample,
    title: Faker::Lorem.sentence
   )
 end

 lists = List.all

# Create Items
 40.times do
   Item.create!(
     list: lists.sample,
     name: Faker::Lorem.sentence
   )
 end
