class RemoveAncestryFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :ancestry, :string
  end
end
