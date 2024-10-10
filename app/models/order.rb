class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :end_date, presence: true
    validates :start_date, presence: true
    validates :shipping_address, length: { maximum: 250 }
    validates :order_status, presence: true, length: { maximum: 60 }
    #validates :return_date_after_order_date
    #private
    #def return_date_after_order_date
      #if return_date.present? && order_date.present? && return_date <= order_date
        #errors.add(:return_date, "must be after order date")
      #end
    #end
end
