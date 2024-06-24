# frozen_string_literal: true

ActiveAdmin.register Property do # rubocop:disable Metrics/BlockLength
  # Index table
  index do
    id_column
    column :caption
    column :variant
    column :size do |property|
      if property.variant == 'Land'
        "#{property.size} Katha"
      else
        "#{property.size} Sq. Ft"
      end
    end
    column :agent
    column :area
    column :location
    column :description do |property|
      "#{property.description[0...50]}..."
    end
    column :created_at
    column :updated_at
  end

  filter :created_at
  filter :updated_at
  filter :agent

  # Scopes
  scope :all, default: true

  scope 'Flat', :flat, group: :variant
  scope 'Land', :land, group: :variant

  scope 'Available', :available, group: :status
  scope 'Locked', :locked, group: :status
  scope 'Private', :private_, group: :status
  scope 'Sold', :sold, group: :status
end
