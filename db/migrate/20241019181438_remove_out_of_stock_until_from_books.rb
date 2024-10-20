class RemoveOutOfStockUntilFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :out_of_stock_until, :date
  end
end
