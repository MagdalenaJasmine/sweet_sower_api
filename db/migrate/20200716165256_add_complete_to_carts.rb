class AddCompleteToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :complete, :boolean
  end
end
