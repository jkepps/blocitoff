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

# Create my user account
User.create!(
	username: "jepps",
	email: "member@example.com",
	password: "password"
)

# Create to-do list items
40.times do
	item = Item.create!(
		name: Lorem.sentence,
		user: users.sample
	)
	item.update_attribute(:created_at, rand(10.minutes..14.days).ago)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"