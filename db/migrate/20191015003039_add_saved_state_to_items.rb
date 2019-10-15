class AddSavedStateToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :saved_state, :string
  end
end
