class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book


  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  before_create :check_availability

  private

  def end_date_after_start_date
    return if start_date.nil? || end_date.nil?

    if end_date <= start_date
      errors.add(:end_date, 'must be after the start date')
    end
  end

  def check_availability
    unless book.available_for_booking?
      errors.add(:book, "is currently out of stock.")
      throw :abort
    end
  end

  def decrement_book_stock
    book.decrement_stock!
  end
end
