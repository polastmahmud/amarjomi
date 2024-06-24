# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :property
  belongs_to :agent
end
