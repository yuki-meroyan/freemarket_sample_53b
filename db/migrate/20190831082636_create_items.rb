class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name             , null: false
      t.text        :description
      t.string      :ancestry         , null: false
      t.integer     :price            , null: false
      t.string      :region           , null: false
      t.boolean     :delivery_fee     , null: false
      t.string      :delivery_days    , null: false
      t.string      :shipping_method  , null: false
      t.references  :brand            , null: false, foreign_key: true
      t.references  :user             , null: false, foreign_key: true
      t.references  :category         , null: false, foreign_key: true
      t.timestamps
    end
  end
end
