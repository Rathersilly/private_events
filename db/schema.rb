# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_17_184823) do

  create_table "events", force: :cascade do |t|
    t.integer "host_id"
    t.string "place"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["host_id"], name: "index_events_on_host_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "host_id", null: false
    t.integer "invitee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "accepted", default: false
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["host_id"], name: "index_invitations_on_host_id"
    t.index ["invitee_id"], name: "index_invitations_on_invitee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "events", "users", column: "host_id"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "users", column: "host_id"
  add_foreign_key "invitations", "users", column: "invitee_id"
end
