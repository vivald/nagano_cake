class ChangeCratItemsToCartItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :crat_items, :cart_items
  end
end
