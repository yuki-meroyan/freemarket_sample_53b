class AddBrandToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :brand, null: true, foreign_key: true
  end
end
