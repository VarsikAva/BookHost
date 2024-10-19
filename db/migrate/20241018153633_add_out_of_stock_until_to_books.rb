class AddOutOfStockUntilToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :out_of_stock_until, :date
  end
end
