class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :count
     

      t.timestamps
    end
  end
end
