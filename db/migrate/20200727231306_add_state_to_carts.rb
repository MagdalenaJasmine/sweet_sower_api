class AddStateToCarts < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE cart_state AS ENUM ('in_progress', 'completed', 'abandoned');
    SQL
    add_column :carts, :state, :cart_state, :default => 'in_progress'
  end

  def down
    remove_column :carts, :state
    execute <<-SQL
      DROP TYPE cart_state;
    SQL
  end
end
