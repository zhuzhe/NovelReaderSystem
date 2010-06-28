# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100531145816) do

  create_table "Accounts_Novels", :id => false, :force => true do |t|
    t.integer  "account_id"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "pwd"
    t.string   "email"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "account_id"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "novels", :force => true do |t|
    t.text     "name"
    t.string   "writer"
    t.string   "url"
    t.integer  "click_count",    :default => 0
    t.integer  "download_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "answer"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
