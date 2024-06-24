class AddLocationToProperty < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :location, :text, null: false
  end
end
