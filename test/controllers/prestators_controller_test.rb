require 'test_helper'

class PrestatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prestator = prestators(:one)
  end

  test "should get index" do
    get prestators_url
    assert_response :success
  end

  test "should get new" do
    get new_prestator_url
    assert_response :success
  end

  test "should create prestator" do
    assert_difference('Prestator.count') do
      post prestators_url, params: { prestator: { address: @prestator.address, city: @prestator.city, country: @prestator.country, name: @prestator.name, phone: @prestator.phone, status: @prestator.status, user_id: @prestator.user_id } }
    end

    assert_redirected_to prestator_url(Prestator.last)
  end

  test "should show prestator" do
    get prestator_url(@prestator)
    assert_response :success
  end

  test "should get edit" do
    get edit_prestator_url(@prestator)
    assert_response :success
  end

  test "should update prestator" do
    patch prestator_url(@prestator), params: { prestator: { address: @prestator.address, city: @prestator.city, country: @prestator.country, name: @prestator.name, phone: @prestator.phone, status: @prestator.status, user_id: @prestator.user_id } }
    assert_redirected_to prestator_url(@prestator)
  end

  test "should destroy prestator" do
    assert_difference('Prestator.count', -1) do
      delete prestator_url(@prestator)
    end

    assert_redirected_to prestators_url
  end
end
