class RemoveDateFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :date, :date
  end
end
