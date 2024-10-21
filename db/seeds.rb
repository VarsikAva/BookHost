# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'
require 'faker'


puts 'Cleaning database...'
Booking.destroy_all
Book.destroy_all
User.destroy_all


# puts "Cleaning database..."
# Book.destroy_all
# User.destroy_all
# Order.destroy_all
puts "Database destroyed"
puts "Creation of the new database"
puts "Creation of users..."
users = []
users << User.create(
  email: "symilide@gmail.com",
  password: "123456",
  address: "Chemin des dailles 15",
  first_name: "Emy",
  last_name: "Lianne"
)
users << User.create(
  email: "lise@gmail.com",
  password: "123456",
  address: "Baselstrasse 12",
  first_name: "Lise",
  last_name: "Weingart"
)
users << User.create(
  email: "varsik@gmail.com",
  password: "123456",
  address: "route de la chance 14",
  first_name: "Varsik",
  last_name: "Orchanian"
)
puts "Creation of book..."

20.times do
  book = Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    isbn: Faker::Number.unique.number(digits: 13).to_s,
    price: Faker::Commerce.price(range: 1..10),
    stock_quantity: Faker::Number.between(from: 0, to: 5),
    owner: users.sample,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    renter: users.sample
  )
  file = URI.parse(Faker::LoremFlickr.image(size: "300x400")).open
  book.cover.attach(io: file, filename: "cover_#{book.id}.jpg", content_type: "image/jpg")
  book.save
end

puts "20 books are created"
