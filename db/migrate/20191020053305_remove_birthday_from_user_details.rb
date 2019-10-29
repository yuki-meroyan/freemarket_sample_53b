class RemoveBirthdayFromUserDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_details, :birthday, :integer
  end
end
