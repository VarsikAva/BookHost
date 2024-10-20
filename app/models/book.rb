class Book < ApplicationRecord
  belongs_to :seller, class_name: :User
  has_many :bookings
  has_one_attached :cover

  validates :title, presence: true, length: { maximum: 60 }
  validates :author, presence: true, length: { maximum: 60 }
  validates :price, presence: true
  validates :isbn, presence: true, length: { maximum: 20 }
  validates :stock_quantity, presence: true

  def available_for_booking?
    stock_quantity > 0
  end

  def decrement_stock!
    if stock_quantity - 1 <= 0
    end
    update(stock_quantity: stock_quantity - 1)
  end
end
