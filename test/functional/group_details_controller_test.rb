require 'test_helper'

class GroupDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_detail" do
    assert_difference('GroupDetail.count') do
      post :create, :group_detail => { }
    end

    assert_redirected_to group_detail_path(assigns(:group_detail))
  end

  test "should show group_detail" do
    get :show, :id => group_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => group_details(:one).to_param
    assert_response :success
  end

  test "should update group_detail" do
    put :update, :id => group_details(:one).to_param, :group_detail => { }
    assert_redirected_to group_detail_path(assigns(:group_detail))
  end

  test "should destroy group_detail" do
    assert_difference('GroupDetail.count', -1) do
      delete :destroy, :id => group_details(:one).to_param
    end

    assert_redirected_to group_details_path
  end
end
