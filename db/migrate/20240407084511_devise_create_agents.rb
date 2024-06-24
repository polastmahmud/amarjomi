# frozen_string_literal: true

class DeviseCreateAgents < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :agents do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :name
      t.string :phone
      t.timestamps null: false
    end
    add_index :agents, :email,                unique: true
    add_index :agents, :reset_password_token, unique: true
  end
end
