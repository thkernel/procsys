require 'test_helper'

class MaintenanceReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_report = maintenance_reports(:one)
  end

  test "should get index" do
    get maintenance_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_report_url
    assert_response :success
  end

  test "should create maintenance_report" do
    assert_difference('MaintenanceReport.count') do
      post maintenance_reports_url, params: { maintenance_report: { description: @maintenance_report.description, motif: @maintenance_report.motif, status: @maintenance_report.status, user_id: @maintenance_report.user_id, work_order_id: @maintenance_report.work_order_id } }
    end

    assert_redirected_to maintenance_report_url(MaintenanceReport.last)
  end

  test "should show maintenance_report" do
    get maintenance_report_url(@maintenance_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_report_url(@maintenance_report)
    assert_response :success
  end

  test "should update maintenance_report" do
    patch maintenance_report_url(@maintenance_report), params: { maintenance_report: { description: @maintenance_report.description, motif: @maintenance_report.motif, status: @maintenance_report.status, user_id: @maintenance_report.user_id, work_order_id: @maintenance_report.work_order_id } }
    assert_redirected_to maintenance_report_url(@maintenance_report)
  end

  test "should destroy maintenance_report" do
    assert_difference('MaintenanceReport.count', -1) do
      delete maintenance_report_url(@maintenance_report)
    end

    assert_redirected_to maintenance_reports_url
  end
end
