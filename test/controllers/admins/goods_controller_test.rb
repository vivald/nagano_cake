require 'test_helper'

class Admins::GoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_goods_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_goods_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_goods_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_goods_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_goods_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_goods_update_url
    assert_response :success
  end
end
