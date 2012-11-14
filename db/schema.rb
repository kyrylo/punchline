# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121112160826) do

  create_table "aliases", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "artist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "aliases", ["artist_id"], :name => "index_aliases_on_artist_id"

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "city"
    t.text     "bio"
    t.boolean  "rap_group",  :default => false, :null => false
  end

  create_table "explanations", :force => true do |t|
    t.integer  "line_id"
    t.text     "text",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "explanations", ["line_id"], :name => "index_explanations_on_line_id"

  create_table "lines", :force => true do |t|
    t.integer  "lyric_id"
    t.text     "text",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "lines", ["lyric_id"], :name => "index_lines_on_lyric_id"

  create_table "lyrics", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "text",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "artist_id"
  end

  add_index "lyrics", ["artist_id"], :name => "index_lyrics_on_artist_id"

  create_table "memberships", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
