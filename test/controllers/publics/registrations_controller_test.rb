require 'test_helper'

class Publics::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publics_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get publics_registrations_create_url
    assert_response :success
  end
end
