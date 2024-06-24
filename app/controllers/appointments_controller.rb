# frozen_string_literal: true

class AppointmentsController < InheritedResources::Base
  def new
    @property = Property.find(params[:property_id])
    @appointment = @property.appointments.new
  end

  def create; end
  
  private

  def appointment_params
    params.require(:appointment).permit(:property_id, :agent_id, :date,
                                        :client_name, :client_address, :time_slot,
                                        :client_phone_number, :addtional_query)
  end
end
