require 'test_helper'

class DeliverySlipProcessingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_slip_processing = delivery_slip_processings(:one)
  end

  test "should get index" do
    get delivery_slip_processings_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_slip_processing_url
    assert_response :success
  end

  test "should create delivery_slip_processing" do
    assert_difference('DeliverySlipProcessing.count') do
      post delivery_slip_processings_url, params: { delivery_slip_processing: { delivery_slip_id: @delivery_slip_processing.delivery_slip_id, motif_id: @delivery_slip_processing.motif_id, processing_date: @delivery_slip_processing.processing_date, status: @delivery_slip_processing.status, time_limit: @delivery_slip_processing.time_limit, user_id: @delivery_slip_processing.user_id } }
    end

    assert_redirected_to delivery_slip_processing_url(DeliverySlipProcessing.last)
  end

  test "should show delivery_slip_processing" do
    get delivery_slip_processing_url(@delivery_slip_processing)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_slip_processing_url(@delivery_slip_processing)
    assert_response :success
  end

  test "should update delivery_slip_processing" do
    patch delivery_slip_processing_url(@delivery_slip_processing), params: { delivery_slip_processing: { delivery_slip_id: @delivery_slip_processing.delivery_slip_id, motif_id: @delivery_slip_processing.motif_id, processing_date: @delivery_slip_processing.processing_date, status: @delivery_slip_processing.status, time_limit: @delivery_slip_processing.time_limit, user_id: @delivery_slip_processing.user_id } }
    assert_redirected_to delivery_slip_processing_url(@delivery_slip_processing)
  end

  test "should destroy delivery_slip_processing" do
    assert_difference('DeliverySlipProcessing.count', -1) do
      delete delivery_slip_processing_url(@delivery_slip_processing)
    end

    assert_redirected_to delivery_slip_processings_url
  end
end
