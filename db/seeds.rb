# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Group.delete_all
Post.delete_all

User.create({name: "Torino", email: 'test@test.com'})

10.times do |i|
  group = Group.create({title: "Group #{i}", user: User.first})
  100.times do |j|
    Post.create({content: "Lorem ipsum dolor sit amet. #{i}-#{j}", group: group, user: User.first})
  end
end


