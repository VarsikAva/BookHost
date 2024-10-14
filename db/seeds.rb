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
Book.destroy_all
User.destroy_all
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
Book.create(
  seller: lise,
  title: "Pride and Prejudice",
  author: "Jane Austen",
  price: 10,
  isbn: "978-0-19-953556-9",
  stock_quantity: 5,
  image_url: "https://imgs.search.brave.com/GzQwrul-HY6Sb4S35XuUVDRTR8Qx6fLo39N0NYu3gNc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2ZiLzUz/L2ZmL2ZiNTNmZmFk/ZWZmYTg0ZmM2Zjgx/YjI4MDZmZGIyNGMx/LmpwZw"
)
Book.create(
  seller: varsik,
  title: "To Kill a Mockingbird",
  author: "Harper Lee",
  price: 8,
  isbn: "978-0-06-112008-4",
  stock_quantity: 3,
  image_url: "https://imgs.search.brave.com/AIkWAraDBU8iJMNpMzwVeeBtb0iw-5ItD38yMYPs90M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9iYW5u/ZWRib29rcy5saWJy/YXJ5LmNtdS5lZHUv/d3AtY29udGVudC91/cGxvYWRzLzIwMTkv/MDkvYm9vay1jb3Zl/ci1Uby1LaWxsLWEt/TW9ja2luZ2JpcmQt/bWFueS0xOTYxLTYz/NHgxMDI0LmpwZw"
)
Book.create(
  seller: emylianne,
  title: "1984",
  author: "George Orwell",
  price: 9,
  isbn: "978-0-452-28423-4",
  stock_quantity: 2,
  image_url: "https://imgs.search.brave.com/_Fq4HeoO50RURjVQs8MkpvGTP9fsFV-RNCkGpJXZsJU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NDFCLVJ6WllBRkwu/anBn"
)
Book.create(
  seller: lise,
  title: "The Great Gatsby",
  author: "F. Scott Fitzgerald",
  price: 12,
  isbn: "978-0-7432-7356-5",
  stock_quantity: 4,
  image_url: "https://imgs.search.brave.com/ey15BMQXCzy2einYeOjDZVTD43UGV-X-jIraIxPZr-k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2I2LzI2/L2IxL2I2MjZiMWRk/OTA1NWYyOTQyZWZj/YzNhYzhjNzcyYjEx/LmpwZw"
)
Book.create(
  seller: lise,
  title: "The Catcher in the Rye",
  author: "J.D. Salinger",
  price: 7,
  isbn: "978-0-316-76948-0",
  stock_quantity: 1,
  image_url: "https://imgs.search.brave.com/vILHSvGisBnCoqrlxCovQvydD6T54hUmYJFpEw-3_Pk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NDFoOHkrc291Zkwu/anBn"
)
Book.create(
  seller: varsik,
  title: "The Hobbit",
  author: "J.R.R. Tolkien",
  price: 15,
  isbn: "978-0-618-00221-4",
  stock_quantity: 6,
  image_url: "https://imgs.search.brave.com/riHAfZiQtHI-OkzsHJoF6Qi_Vh7V0ltDd1RmQx9aA78/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2RmL2Rm/LzYwL2RmZGY2MDVi/NDVkZjE4Mjc1ZDY5/ZDk2ODhmYmQ0MmNj/LmpwZw"
)
Book.create(
  seller: emylianne,
  title: "Harry Potter and the Philosopher's Stone",
  author: "J.K. Rowling",
  price: 20,
  isbn: "978-0-7475-3269-9",
  stock_quantity: 8,
  image_url: "https://imgs.search.brave.com/MHOXrmu4mOyAu1GbcpYQ_loIZ8vcTGYDIPZVryYFdV0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzkxTXZqTTY2VytM/LmpwZw"
)
Book.create(
  seller: emylianne,
  title: "The Alchemist",
  author: "Paulo Coelho",
  price: 11,
  isbn: "978-0-06-231500-7",
  stock_quantity: 3,
  image_url: "https://imgs.search.brave.com/wXgDq5CspwRrpdnvBA_lrR95FKg4KTrHpF5h424bd1s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzcxekhEWHUxVGFM/LmpwZw"
)
Book.create(
  seller: varsik,
  title: "The Hunger Games",
  author: "Suzanne Collins",
  price: 14,
  isbn: "978-0-439-02348-1",
  stock_quantity: 5,
  image_url: "https://imgs.search.brave.com/i0mo1SnnR46Q7obeiBIesbLRkU6rE8xPTfIdmry8Nqk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFQSE5tNU1oWEwu/anBn"
)
