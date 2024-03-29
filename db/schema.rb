# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_23_010542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "rushings", force: :cascade do |t|
    t.string "player"
    t.string "team"
    t.string "pos"
    t.integer "att"
    t.integer "att_g"
    t.integer "yds"
    t.float "avg"
    t.integer "yds_g"
    t.integer "td"
    t.string "lng"
    t.integer "first"
    t.integer "first_pct"
    t.integer "twenty_plus"
    t.integer "forty_plus"
    t.integer "fum"
    t.index ["player"], name: "index_rushings_on_player"
  end

end
