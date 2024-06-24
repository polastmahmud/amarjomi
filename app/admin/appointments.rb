# frozen_string_literal: true

ActiveAdmin.register Property
ActiveAdmin.register Appointment do
  permit_params :property_id, :agent_id, :client_name, :client_address, :date,
                :time_slot, :client_phone_number, :addtional_query

  index do
    id_column
    column :property
    column :agent
    column :client_name
    column :client_address
    column :date
    column :time_slot
    column :client_phone_number
    column :addtional_query do |appointment|
      appointment.addtional_query && "#{appointment.addtional_query[0...50]}..."
    end
  end

  filter :agent
  filter :property
  filter :date
  filter :time_slot

  show do
    h2 "Remaining: #{distance_of_time_in_words_to_now(appointment.date)}"
    default_main_content
  end
end
