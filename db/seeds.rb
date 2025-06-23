# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
unless User.exists?(email: 'admin@example.com')
  User.create!(
    email: 'admin@example.com',
    password: 'password123',
    password_confirmation: 'password123'
  )
  puts "Seeded default user: admin@example.com / password123"
else
  puts "User already exists: admin@example.com"
end
