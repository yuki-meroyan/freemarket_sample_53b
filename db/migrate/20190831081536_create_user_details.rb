class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string      :family_name      , null: false
      t.string      :first_name       , null: false
      t.string      :family_name_kana , null: false
      t.string      :first_name_kana  , null: false
      t.integer     :birthday         , null: false
      t.integer     :phone_number     , null: false, unique: true
      t.integer     :postal_code      , null: false
      t.string      :prefectures      , null: false
      t.string      :cities           , null: false
      t.integer     :address          , null: false
      t.string      :building_name
      t.references  :user             , null: false, foreign_key: true
      t.timestamps
    end
  end
end
