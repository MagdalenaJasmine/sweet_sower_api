class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.string :status
      t.integer :user_id
      t.decimal :total_price
      t.integer :total_qty
     
      t.timestamps
    end
  end
end
