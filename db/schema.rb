# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_22_181931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.text "abstract"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "contact"
    t.string "phone"
    t.string "website"
  end

  create_table "founders", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "function"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "enterprise_id"
    t.index ["enterprise_id"], name: "index_founders_on_enterprise_id"
  end

  create_table "investments", force: :cascade do |t|
    t.integer "amount"
    t.boolean "available"
    t.bigint "user_id"
    t.bigint "offer_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_investments_on_offer_id"
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "description"
    t.float "share"
    t.integer "pu"
    t.integer "units"
    t.string "final_date"
    t.bigint "enterprise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_offers_on_enterprise_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "enterprise_id"
    t.string "content"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_reviews_on_enterprise_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "spina_accounts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postal_code"
    t.string "city"
    t.string "phone"
    t.string "email"
    t.text "preferences"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "robots_allowed", default: false
  end

  create_table "spina_attachment_collections", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_attachment_collections_attachments", id: :serial, force: :cascade do |t|
    t.integer "attachment_collection_id"
    t.integer "attachment_id"
  end

  create_table "spina_attachments", id: :serial, force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_image_collections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_image_collections_images", id: :serial, force: :cascade do |t|
    t.integer "image_collection_id"
    t.integer "image_id"
    t.integer "position"
    t.index ["image_collection_id"], name: "index_spina_image_collections_images_on_image_collection_id"
    t.index ["image_id"], name: "index_spina_image_collections_images_on_image_id"
  end

  create_table "spina_images", force: :cascade do |t|
    t.integer "media_folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_folder_id"], name: "index_spina_images_on_media_folder_id"
  end

  create_table "spina_layout_parts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.integer "layout_partable_id"
    t.string "layout_partable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_id"
  end

  create_table "spina_line_translations", id: :serial, force: :cascade do |t|
    t.integer "spina_line_id", null: false
    t.string "locale", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale"], name: "index_spina_line_translations_on_locale"
    t.index ["spina_line_id"], name: "index_spina_line_translations_on_spina_line_id"
  end

  create_table "spina_lines", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spina_media_folders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_navigation_items", id: :serial, force: :cascade do |t|
    t.integer "page_id", null: false
    t.integer "navigation_id", null: false
    t.integer "position", default: 0, null: false
    t.string "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["page_id", "navigation_id"], name: "index_spina_navigation_items_on_page_id_and_navigation_id", unique: true
  end

  create_table "spina_navigations", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "label", null: false
    t.boolean "auto_add_pages", default: false, null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_spina_navigations_on_name", unique: true
  end

  create_table "spina_options", id: :serial, force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_page_parts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_id"
    t.integer "page_partable_id"
    t.string "page_partable_type"
  end

  create_table "spina_page_translations", id: :serial, force: :cascade do |t|
    t.integer "spina_page_id", null: false
    t.string "locale", null: false
    t.string "title"
    t.string "menu_title"
    t.string "description"
    t.string "seo_title"
    t.string "materialized_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale"], name: "index_spina_page_translations_on_locale"
    t.index ["spina_page_id"], name: "index_spina_page_translations_on_spina_page_id"
  end

  create_table "spina_pages", id: :serial, force: :cascade do |t|
    t.boolean "show_in_menu", default: true
    t.string "slug"
    t.boolean "deletable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "skip_to_first_child", default: false
    t.string "view_template"
    t.string "layout_template"
    t.boolean "draft", default: false
    t.string "link_url"
    t.string "ancestry"
    t.integer "position"
    t.boolean "active", default: true
    t.integer "resource_id"
    t.index ["resource_id"], name: "index_spina_pages_on_resource_id"
  end

  create_table "spina_resources", force: :cascade do |t|
    t.string "name", null: false
    t.string "label"
    t.string "view_template"
    t.integer "parent_page_id"
    t.string "order_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_page_id"], name: "index_spina_resources_on_parent_page_id"
  end

  create_table "spina_rewrite_rules", id: :serial, force: :cascade do |t|
    t.string "old_path"
    t.string "new_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spina_settings", id: :serial, force: :cascade do |t|
    t.string "plugin"
    t.jsonb "preferences", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plugin"], name: "index_spina_settings_on_plugin"
  end

  create_table "spina_structure_items", id: :serial, force: :cascade do |t|
    t.integer "structure_id"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["structure_id"], name: "index_spina_structure_items_on_structure_id"
  end

  create_table "spina_structure_parts", id: :serial, force: :cascade do |t|
    t.integer "structure_item_id"
    t.integer "structure_partable_id"
    t.string "structure_partable_type"
    t.string "name"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["structure_item_id"], name: "index_spina_structure_parts_on_structure_item_id"
    t.index ["structure_partable_id"], name: "index_spina_structure_parts_on_structure_partable_id"
  end

  create_table "spina_structures", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spina_text_translations", id: :serial, force: :cascade do |t|
    t.integer "spina_text_id", null: false
    t.string "locale", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale"], name: "index_spina_text_translations_on_locale"
    t.index ["spina_text_id"], name: "index_spina_text_translations_on_spina_text_id"
  end

  create_table "spina_texts", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spina_users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_logged_in"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "enterprise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_stocks_on_enterprise_id"
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "name"
    t.string "cpf"
    t.string "address"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "founders", "enterprises"
end
