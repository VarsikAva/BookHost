class Book < ApplicationRecord
  belongs_to :users,foreign_key: 'seller_id'
  has_many :orders, foreign_key: 'book_id'

  validates :title, presence: true, length: { maximum: 60 }
  validates :author, presence: true, length: { maximum: 60 }
  validates :price, presence: true
  validates :isbn, presence: true, length: { maximum: 20 }
  validates :stock_quantity, presence: true
  validates :image_url, presence: true, length: { maximum: 255 }
end
