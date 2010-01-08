require 'test_helper'

class PbxDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pbx_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pbx_detail" do
    assert_difference('PbxDetail.count') do
      post :create, :pbx_detail => { }
    end

    assert_redirected_to pbx_detail_path(assigns(:pbx_detail))
  end

  test "should show pbx_detail" do
    get :show, :id => pbx_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pbx_details(:one).to_param
    assert_response :success
  end

  test "should update pbx_detail" do
    put :update, :id => pbx_details(:one).to_param, :pbx_detail => { }
    assert_redirected_to pbx_detail_path(assigns(:pbx_detail))
  end

  test "should destroy pbx_detail" do
    assert_difference('PbxDetail.count', -1) do
      delete :destroy, :id => pbx_details(:one).to_param
    end

    assert_redirected_to pbx_details_path
  end
end
