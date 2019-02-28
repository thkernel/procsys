require 'test_helper'

class OrderTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_type = order_types(:one)
  end

  test "should get index" do
    get order_types_url
    assert_response :success
  end

  test "should get new" do
    get new_order_type_url
    assert_response :success
  end

  test "should create order_type" do
    assert_difference('OrderType.count') do
      post order_types_url, params: { order_type: { description: @order_type.description, name: @order_type.name, status: @order_type.status, user_id: @order_type.user_id } }
    end

    assert_redirected_to order_type_url(OrderType.last)
  end

  test "should show order_type" do
    get order_type_url(@order_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_type_url(@order_type)
    assert_response :success
  end

  test "should update order_type" do
    patch order_type_url(@order_type), params: { order_type: { description: @order_type.description, name: @order_type.name, status: @order_type.status, user_id: @order_type.user_id } }
    assert_redirected_to order_type_url(@order_type)
  end

  test "should destroy order_type" do
    assert_difference('OrderType.count', -1) do
      delete order_type_url(@order_type)
    end

    assert_redirected_to order_types_url
  end
end
