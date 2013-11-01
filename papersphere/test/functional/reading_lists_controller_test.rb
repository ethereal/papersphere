require 'test_helper'
include Devise::TestHelpers

class ReadingListsControllerTest < ActionController::TestCase
  setup do
    @reading_list = reading_lists(:one)
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reading_lists)
  end

  test "should create reading_list" do
    assert_difference('ReadingList.count') do
      post :create, reading_list: { name: 'new_reading_list' }
    end

    assert_redirected_to reading_list_path(assigns(:reading_list))
  end

  test "should show reading_list" do
    get :show, id: @reading_list
    assert_response :success
  end

  test "should update reading_list" do
    put :update, id: @reading_list, reading_list: { name: @reading_list.name }
    assert_redirected_to reading_list_path(assigns(:reading_list))
  end

  test "should destroy reading_list" do
    assert_difference('ReadingList.count', -1) do
      delete :destroy, id: @reading_list
    end

    assert_redirected_to reading_lists_path
  end
end
