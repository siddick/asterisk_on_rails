require 'test_helper'

class PbxesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pbxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pbx" do
    assert_difference('Pbx.count') do
      post :create, :pbx => { }
    end

    assert_redirected_to pbx_path(assigns(:pbx))
  end

  test "should show pbx" do
    get :show, :id => pbxes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pbxes(:one).to_param
    assert_response :success
  end

  test "should update pbx" do
    put :update, :id => pbxes(:one).to_param, :pbx => { }
    assert_redirected_to pbx_path(assigns(:pbx))
  end

  test "should destroy pbx" do
    assert_difference('Pbx.count', -1) do
      delete :destroy, :id => pbxes(:one).to_param
    end

    assert_redirected_to pbxes_path
  end
end
