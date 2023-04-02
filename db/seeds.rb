# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Rake.application["db:fixtures:load"].invoke

User.create!(
  email: "noah@gmail.com",
  password: "Boomer72_1998",
  api_keys: [ApiKey.new(id: "51b1b21c-eed5-4e4f-8918-fe448b7f3c29")]
)
