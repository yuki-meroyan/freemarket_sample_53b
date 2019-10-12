class CreateTransactionInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_informations do |t|
      t.integer     :seller_id, null: false
      t.integer     :buyer_id , null: false
      t.datetime    :purchase_day
      t.references  :item  , null: false, foreign_key: true
      t.timestamps
    end
  end
end
