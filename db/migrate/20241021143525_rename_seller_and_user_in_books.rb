class RenameSellerAndUserInBooks < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :seller_id, :owner_id
    rename_column :books, :user_id, :renter_id
  end
end
