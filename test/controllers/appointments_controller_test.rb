require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference("Appointment.count") do
      post appointments_url, params: { appointment: { addtional_query: @appointment.addtional_query, agent_id: @appointment.agent_id, client_address: @appointment.client_address, client_name: @appointment.client_name, client_phone_number: @appointment.client_phone_number, date: @appointment.date, property_id: @appointment.property_id, time_slot: @appointment.time_slot } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { addtional_query: @appointment.addtional_query, agent_id: @appointment.agent_id, client_address: @appointment.client_address, client_name: @appointment.client_name, client_phone_number: @appointment.client_phone_number, date: @appointment.date, property_id: @appointment.property_id, time_slot: @appointment.time_slot } }
    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
  end
end
