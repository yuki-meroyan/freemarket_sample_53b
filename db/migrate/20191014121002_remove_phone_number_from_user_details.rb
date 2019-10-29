class RemovePhoneNumberFromUserDetails < ActiveRecord::Migration[5.2]

  def up
    remove_column :user_details, :phone_number
      end

  def down
    add_column :user_details, :phone_number, :integer
  end
end
