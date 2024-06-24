# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :caption
      t.string :area
      t.string :variant
      t.string :status
      t.text :description
      t.float :size
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
