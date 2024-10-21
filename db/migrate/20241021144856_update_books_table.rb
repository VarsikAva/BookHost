class UpdateBooksTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :user_id, :bigint if column_exists?(:books, :user_id)

    add_foreign_key :books, :users, column: :owner_id
    add_foreign_key :books, :users, column: :renter_id
  end
end
