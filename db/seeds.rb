# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Order.destroy_all
User.destroy_all
Book.destroy_all
puts "Database destroyed"
puts "Creation of the new database"
puts "Creation of users..."
emylianne = User.create(
  email: "symilide@gmail.com",
  password: "123456",
  address: "Chemin des dailles 15",
  first_name: "Emy",
  last_name: "Lianne"
)
lise = User.create(
  email: "lise@gmail.com",
  password: "123456",
  address: "Baselstrasse 12",
  first_name: "Lise",
  last_name: "Weingart"
)
varsik = User.create(
  email: "varsik@gmail.com",
  password: "123456",
  address: "route de la chance 14",
  first_name: "Varsik",
  last_name: "Orchanian"
)
puts "Creation of book..."
Book.create(
  seller: emylianne,
  # seller_id: emylianne.id
  title: "Ce que veulent les gentlemen",
  author: "Caroline Linden",
  price: 7,
  isbn: "978-2-8112-1274-2",
  stock_quantity: 1,
  image_url: "https://imgs.search.brave.com/VUq5I6hZ9lu753xetpFCCIgJQbr4_YuWmn0bMrFY9pM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wcm9k/dWN0cy1pbWFnZXMu/ZGktc3RhdGljLmNv/bS9pbWFnZS9jYXJv/bGluZS1saW5kZW4t/Y2UtcXVlLXZldWxl/bnQtbGVzLWdlbnRs/ZW1lbi85NzgyODEx/MjEyNzQyLTQ3NXg1/MDAtMS5qcGc"
)
