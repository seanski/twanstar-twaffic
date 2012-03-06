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

ActiveRecord::Schema.define(:version => 20120305231106) do

  create_table "incidents", :force => true do |t|
    t.string   "location"
    t.string   "description"
    t.integer  "vehicles"
    t.string   "lanes"
    t.string   "status"
    t.datetime "reported_at"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "incidents", ["latitude", "longitude", "reported_at", "vehicles", "status", "description"], :name => "collision_index", :unique => true

end
