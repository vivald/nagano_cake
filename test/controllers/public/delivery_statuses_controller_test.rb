require 'test_helper'

class Public::DeliveryStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_delivery_statuses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_delivery_statuses_edit_url
    assert_response :success
  end

end
