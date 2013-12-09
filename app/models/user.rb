# Schema
#
# t.string   "first_name"
# t.string   "last_name"
# t.string   "email"
# t.string   "hashed_password"
# t.string   "phone_no"
# t.integer  "group_id"
# t.integer  "permission_level"
# t.string   "username"
# t.datetime "created_at"
# t.datetime "updated_at"

class User < ActiveRecord::Base
  validates :email, :first_name, :last_name, :phone_no, :username, presence: true
end
