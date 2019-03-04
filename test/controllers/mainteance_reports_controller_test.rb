require 'test_helper'

class MainteanceReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mainteance_report = mainteance_reports(:one)
  end

  test "should get index" do
    get mainteance_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_mainteance_report_url
    assert_response :success
  end

  test "should create mainteance_report" do
    assert_difference('MainteanceReport.count') do
      post mainteance_reports_url, params: { mainteance_report: { description: @mainteance_report.description, motif: @mainteance_report.motif, status: @mainteance_report.status, user_id: @mainteance_report.user_id, work_order_id: @mainteance_report.work_order_id } }
    end

    assert_redirected_to mainteance_report_url(MainteanceReport.last)
  end

  test "should show mainteance_report" do
    get mainteance_report_url(@mainteance_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_mainteance_report_url(@mainteance_report)
    assert_response :success
  end

  test "should update mainteance_report" do
    patch mainteance_report_url(@mainteance_report), params: { mainteance_report: { description: @mainteance_report.description, motif: @mainteance_report.motif, status: @mainteance_report.status, user_id: @mainteance_report.user_id, work_order_id: @mainteance_report.work_order_id } }
    assert_redirected_to mainteance_report_url(@mainteance_report)
  end

  test "should destroy mainteance_report" do
    assert_difference('MainteanceReport.count', -1) do
      delete mainteance_report_url(@mainteance_report)
    end

    assert_redirected_to mainteance_reports_url
  end
end
