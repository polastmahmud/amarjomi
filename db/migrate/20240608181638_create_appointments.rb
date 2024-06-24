class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :property, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.date :date
      t.string :client_name
      t.text :client_address
      t.string :time_slot
      t.string :client_phone_number
      t.text :addtional_query

      t.timestamps
    end
  end
end
