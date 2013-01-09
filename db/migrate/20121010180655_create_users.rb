class CreateUsers < ActiveRecord::Migration
  def change
    create_table "users", :id => false, :force => true do |t|
      t.integer  "id",                                        :default => 0, :null => false
      t.string   "given_name"
      t.string   "family_name"
      t.date     "date_of_birth"
      t.integer  "gender"
      t.string   "phone"
      t.string   "address"
      t.integer  "postal_code"
      t.integer  "country_id"
      t.string   "next_of_kin_name"
      t.string   "next_of_kin_tlf"
      t.text     "tasks"
      t.string   "study"
      t.integer  "study_place_id"
      t.string   "private_email"
      t.integer  "cardnumber_ntnu"
      t.integer  "cardnumber_samfundet"
      t.string   "city"
      t.string   "username"
      t.integer  "ldap_id"
      t.string   "profile_picture_file_name"
      t.string   "profile_picture_content_type"
      t.integer  "profile_picture_file_size"
      t.datetime "profile_picture_updated_at"
      t.integer  "has_skies"
      t.integer  "shoe_size"
      t.integer  "have_group_card"
      t.text     "media_contacts"
      t.string   "local_paper"
      t.integer  "vegetarian",                   :limit => 1
      t.integer  "lactose_allergy",              :limit => 1
      t.integer  "gluten_allergy",               :limit => 1
      t.integer  "nut_allergy",                  :limit => 1
      t.integer  "fruit_allergy",                :limit => 1
      t.text     "other_allergy"
      t.integer  "no_allergy",                   :limit => 1
      t.string   "password_hash"
      t.string   "password_salt"
      t.string   "email"
      t.string   "password_digest"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "twitter_username"
      t.string   "facebook_id"
      t.string   "facebook_token"
    end
  end
end
