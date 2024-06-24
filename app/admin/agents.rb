# frozen_string_literal: true

ActiveAdmin.register Agent do # rubocop:disable Metrics/BlockLength
  config.filters = false

  permit_params :email, :password, :password_confirmation, :name, :phone

  index do
    id_column
    column :email
    column :name
    column :phone
    column :created_at
    column :updated_at
  end

  show do
    h2 agent.name
    attributes_table do
      row :email
      row :phone
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :name
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
