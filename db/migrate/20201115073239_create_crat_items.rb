class CreateCratItems < ActiveRecord::Migration[5.2]
  def change
    create_table :crat_items do |t|
      t.integer :item_id, null: false
      t.integer :customer_id , null: false
      t.integer :amount, null: false
      
      t.timestamps
    end
  end
end
