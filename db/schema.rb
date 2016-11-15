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

ActiveRecord::Schema.define(version: 20161111043201) do

  create_table "boards", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "cells", force: :cascade do |t|
    t.integer  "position_x",                 null: false
    t.integer  "position_y",                 null: false
    t.boolean  "checked",    default: false
    t.boolean  "available",  default: true
    t.integer  "board_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["board_id"], name: "index_cells_on_board_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "initials"
    t.datetime "start_time"
    t.time     "win_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ships", force: :cascade do |t|
    t.boolean  "sunk",          default: false
    t.boolean  "computer_ship", default: false
    t.integer  "cell_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["cell_id"], name: "index_ships_on_cell_id"
  end

end
