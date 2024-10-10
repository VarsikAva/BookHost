class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :quantity
      t.float :total_price
      t.date :start_date
      t.date :end_date
      t.string :shipping_adress
      t.string :order_status

      t.timestamps
    end
  end
end
