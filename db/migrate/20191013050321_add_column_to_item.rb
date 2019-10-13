class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status  , :integer, after: :shipping_method, default: 0
    add_column :items, :buyer_id, :integer, after: :status
  end
end
