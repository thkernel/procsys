require 'test_helper'

class MaintenanceRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_request = maintenance_requests(:one)
  end

  test "should get index" do
    get maintenance_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_request_url
    assert_response :success
  end

  test "should create maintenance_request" do
    assert_difference('MaintenanceRequest.count') do
      post maintenance_requests_url, params: { maintenance_request: { motif: @maintenance_request.motif, station_id: @maintenance_request.station_id, status: @maintenance_request.status, user_id: @maintenance_request.user_id } }
    end

    assert_redirected_to maintenance_request_url(MaintenanceRequest.last)
  end

  test "should show maintenance_request" do
    get maintenance_request_url(@maintenance_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_request_url(@maintenance_request)
    assert_response :success
  end

  test "should update maintenance_request" do
    patch maintenance_request_url(@maintenance_request), params: { maintenance_request: { motif: @maintenance_request.motif, station_id: @maintenance_request.station_id, status: @maintenance_request.status, user_id: @maintenance_request.user_id } }
    assert_redirected_to maintenance_request_url(@maintenance_request)
  end

  test "should destroy maintenance_request" do
    assert_difference('MaintenanceRequest.count', -1) do
      delete maintenance_request_url(@maintenance_request)
    end

    assert_redirected_to maintenance_requests_url
  end
end
