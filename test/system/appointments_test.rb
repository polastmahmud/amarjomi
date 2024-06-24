require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @appointment = appointments(:one)
  end

  test "visiting the index" do
    visit appointments_url
    assert_selector "h1", text: "Appointments"
  end

  test "should create appointment" do
    visit appointments_url
    click_on "New appointment"

    fill_in "Addtional query", with: @appointment.addtional_query
    fill_in "Agent", with: @appointment.agent_id
    fill_in "Client address", with: @appointment.client_address
    fill_in "Client name", with: @appointment.client_name
    fill_in "Client phone number", with: @appointment.client_phone_number
    fill_in "Date", with: @appointment.date
    fill_in "Property", with: @appointment.property_id
    fill_in "Time slot", with: @appointment.time_slot
    click_on "Create Appointment"

    assert_text "Appointment was successfully created"
    click_on "Back"
  end

  test "should update Appointment" do
    visit appointment_url(@appointment)
    click_on "Edit this appointment", match: :first

    fill_in "Addtional query", with: @appointment.addtional_query
    fill_in "Agent", with: @appointment.agent_id
    fill_in "Client address", with: @appointment.client_address
    fill_in "Client name", with: @appointment.client_name
    fill_in "Client phone number", with: @appointment.client_phone_number
    fill_in "Date", with: @appointment.date
    fill_in "Property", with: @appointment.property_id
    fill_in "Time slot", with: @appointment.time_slot
    click_on "Update Appointment"

    assert_text "Appointment was successfully updated"
    click_on "Back"
  end

  test "should destroy Appointment" do
    visit appointment_url(@appointment)
    click_on "Destroy this appointment", match: :first

    assert_text "Appointment was successfully destroyed"
  end
end
