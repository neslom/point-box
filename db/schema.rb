ActiveRecord::Schema.define(version: 20150307012620) do

  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "password_digest"
    t.text     "available_points"
    t.text     "redeemed_points"
    t.integer  "role",             default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
