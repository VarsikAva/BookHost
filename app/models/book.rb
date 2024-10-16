class Book < ApplicationRecord
  belongs_to :seller, class_name: :User
  has_many :bookings
  validates :title, presence: true, length: { maximum: 60 }
  validates :author, presence: true, length: { maximum: 60 }
  validates :price, presence: true
  validates :isbn, presence: true, length: { maximum: 20 }
  validates :stock_quantity, presence: true
  validates :image_url, presence: true
end
