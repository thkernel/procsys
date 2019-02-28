require 'test_helper'

class MotifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motif = motifs(:one)
  end

  test "should get index" do
    get motifs_url
    assert_response :success
  end

  test "should get new" do
    get new_motif_url
    assert_response :success
  end

  test "should create motif" do
    assert_difference('Motif.count') do
      post motifs_url, params: { motif: { description: @motif.description, name: @motif.name, status: @motif.status, user_id: @motif.user_id } }
    end

    assert_redirected_to motif_url(Motif.last)
  end

  test "should show motif" do
    get motif_url(@motif)
    assert_response :success
  end

  test "should get edit" do
    get edit_motif_url(@motif)
    assert_response :success
  end

  test "should update motif" do
    patch motif_url(@motif), params: { motif: { description: @motif.description, name: @motif.name, status: @motif.status, user_id: @motif.user_id } }
    assert_redirected_to motif_url(@motif)
  end

  test "should destroy motif" do
    assert_difference('Motif.count', -1) do
      delete motif_url(@motif)
    end

    assert_redirected_to motifs_url
  end
end
