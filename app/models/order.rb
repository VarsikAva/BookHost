class Order < ApplicationRecord
  belongs_to :book, foreign_key: 'book_id'
  belongs_to :user, foreign_key: 'user_id'

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :order_start_date, presence: true
  validates :order_end_date, presence: true
  validates :shipping_address, length: { maximum: 250 }
  validates :order_status, presence: true, length: { maximum: 60 }

  validate :return_date_after_order_date

  private

  def return_date_after_order_date
    if return_date.present? && order_date.present? && return_date <= order_date
      errors.add(:return_date, "must be after order date")
    end
  end
end
