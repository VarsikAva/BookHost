class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :isbn
      t.integer :price
      t.integer :stock_quantity
      t.string :image_url
      t.references :seller, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
