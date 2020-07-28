class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :name
      t.string :description
      t.string :product_type
      t.float :price_in_cents
      t.date :date
      t.string :allergens
      t.date :delivery_date
      t.integer :quantity
      t.boolean :sale

      t.timestamps
    end
  end
end
