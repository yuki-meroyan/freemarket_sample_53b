class AddBirthdayToUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :birthday, :date, :null => false
  end
end
