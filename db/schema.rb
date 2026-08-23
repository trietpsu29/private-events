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

ActiveRecord::Schema[8.1].define(version: 2026_08_23_053754) do
  create_table "attendances", force: :cascade do |t|
    t.integer "attended_event_id", null: false
    t.integer "attendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attended_event_id"], name: "index_attendances_on_attended_event_id"
    t.index ["attendee_id"], name: "index_attendances_on_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "creator_id", null: false
    t.datetime "date"
    t.text "description"
    t.boolean "is_private", default: true, null: false
    t.string "location"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "invited_event_id", null: false
    t.integer "invitee_id", null: false
    t.datetime "updated_at", null: false
    t.index ["invited_event_id"], name: "index_invitations_on_invited_event_id"
    t.index ["invitee_id"], name: "index_invitations_on_invitee_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "attendances", "events", column: "attended_event_id"
  add_foreign_key "attendances", "users", column: "attendee_id"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "invitations", "events", column: "invited_event_id"
  add_foreign_key "invitations", "users", column: "invitee_id"
end
