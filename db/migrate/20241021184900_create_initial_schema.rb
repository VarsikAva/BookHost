class CreateInitialSchema < ActiveRecord::Migration[7.1]
  def change
    create_table "active_storage_attachments", force: :cascade do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end

    create_table "active_storage_blobs", force: :cascade do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.string "service_name", null: false
      t.bigint "byte_size", null: false
      t.string "checksum"
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end

    create_table "active_storage_variant_records", force: :cascade do |t|
      t.bigint "blob_id", null: false
      t.string "variation_digest", null: false
      t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
    end

    create_table "bookings", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.bigint "book_id", null: false
      t.date "start_date"
      t.date "end_date"
      t.string "status"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["book_id"], name: "index_bookings_on_book_id"
      t.index ["user_id"], name: "index_bookings_on_user_id"
    end

    create_table "books", force: :cascade do |t|
      t.string "title"
      t.string "author"
      t.string "isbn"
      t.integer "price"
      t.integer "stock_quantity"
      t.string "image_url"
      t.bigint "owner_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.text "description"
      t.bigint "renter_id"
      t.index ["owner_id"], name: "index_books_on_owner_id"
      t.index ["renter_id"], name: "index_books_on_renter_id"
    end

    create_table "messages", force: :cascade do |t|
      t.bigint "sender_id"
      t.bigint "receiver_id"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "orders", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.bigint "book_id", null: false
      t.integer "quantity"
      t.float "total_price"
      t.date "start_date"
      t.date "end_date"
      t.string "shipping_adress"
      t.string "order_status"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["book_id"], name: "index_orders_on_book_id"
      t.index ["user_id"], name: "index_orders_on_user_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "first_name"
      t.string "last_name"
      t.string "address"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
    add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
    add_foreign_key "bookings", "books"
    add_foreign_key "bookings", "users"
    add_foreign_key "books", "users", column: "owner_id"
    add_foreign_key "books", "users", column: "renter_id"
    add_foreign_key "orders", "books"
    add_foreign_key "orders", "users"
  end
end
