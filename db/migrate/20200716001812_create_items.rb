class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :name
      t.string :description
      t.string :product_type
      t.float :price
      t.date :date
      t.string :allergens
      t.date :delivery_date

      t.timestamps
    end
  end
end
