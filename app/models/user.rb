class User < ApplicationRecord
  has_many :owned_books, class_name: 'Book', foreign_key: 'owner_id'
  has_many :rented_books, class_name: 'Book', foreign_key: 'renter_id'
  has_many :bookings

  validates :email, presence: true, uniqueness: true, length: { maximum: 60 }
  validates :password, presence: true, length: { maximum: 20 }
  validates :address, allow_nil: true, length: { maximum: 255 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
