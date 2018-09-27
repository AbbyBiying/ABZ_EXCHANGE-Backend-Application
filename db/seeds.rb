# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Location.create!(city: 'New York', state: 'NY')
# 5.times { FactoryBot.create(:location) }
User.create!(email: 'bi802802@gmail.com', username: 'bi', bio:"I m Bi.", password: "bi802802", location_id: "1")