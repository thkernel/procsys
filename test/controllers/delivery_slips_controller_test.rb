require 'test_helper'

class DeliverySlipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_slip = delivery_slips(:one)
  end

  test "should get index" do
    get delivery_slips_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_slip_url
    assert_response :success
  end

  test "should create delivery_slip" do
    assert_difference('DeliverySlip.count') do
      post delivery_slips_url, params: { delivery_slip: { customer_id: @delivery_slip.customer_id, order_id: @delivery_slip.order_id, ref: @delivery_slip.ref, status: @delivery_slip.status, user_id: @delivery_slip.user_id } }
    end

    assert_redirected_to delivery_slip_url(DeliverySlip.last)
  end

  test "should show delivery_slip" do
    get delivery_slip_url(@delivery_slip)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_slip_url(@delivery_slip)
    assert_response :success
  end

  test "should update delivery_slip" do
    patch delivery_slip_url(@delivery_slip), params: { delivery_slip: { customer_id: @delivery_slip.customer_id, order_id: @delivery_slip.order_id, ref: @delivery_slip.ref, status: @delivery_slip.status, user_id: @delivery_slip.user_id } }
    assert_redirected_to delivery_slip_url(@delivery_slip)
  end

  test "should destroy delivery_slip" do
    assert_difference('DeliverySlip.count', -1) do
      delete delivery_slip_url(@delivery_slip)
    end

    assert_redirected_to delivery_slips_url
  end
end
