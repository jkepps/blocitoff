include Faker

# Create Users
5.times do 
	User.create!(
		username: Internet.user_name, 
		email: Internet.email, 
		password: Internet.password
	)
end
users = User.all

# Create to-do list items
20.times do
	item = Item.create!(
		name: Lorem.sentence,
		user: users.sample
	)
	item.update_attribute(:created_at, rand(10.minutes..8.days).ago)
end

# Create my user account
User.create!(
	username: "jepps",
	email: "member@example.com",
	password: "password"
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"