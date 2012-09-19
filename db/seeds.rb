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

10.times do |i|
  User.create({name: Forgery::Name.full_name, email: Forgery::Internet.email_address})
end

5.times do |i|
  group = Group.create({title: "Group #{i}", user: User.first(:order => "RAND()")})

  time = Time.new - (100 * 10000)
  100.times do |j|
    p = Post.create({content: Forgery(:lorem_ipsum).words(rand(10...75)), group: group, user: User.first(:order => "RAND()")})
    p.created_at = time
    p.save
    time = time + 10000
  end
end


