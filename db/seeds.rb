# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

User.create!({name:  "torino", email: "torinobalonka@gmail.com", password: "111111", password_confirmation: "111111", remember_me: true})

10.times do |i|
  User.create!({name: Forgery::Name.full_name, email: Forgery::Internet.email_address, password: "111111", password_confirmation: "111111", remember_me: true})
end

5.times do |i|
  group = Group.create({title: "Group #{i}", user: User.first()})

  time = Time.new - (100 * 10000)
  100.times do |j|
    p = Post.create({content: Forgery(:lorem_ipsum).words(rand(10...75)), group: group, user: User.first(:order => "RAND()")})
    p.created_at = time
    p.save
    time = time + 10000
  end
end