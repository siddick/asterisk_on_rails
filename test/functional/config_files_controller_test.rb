require 'test_helper'

class ConfigFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:config_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config_file" do
    assert_difference('ConfigFile.count') do
      post :create, :config_file => { }
    end

    assert_redirected_to config_file_path(assigns(:config_file))
  end

  test "should show config_file" do
    get :show, :id => config_files(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => config_files(:one).to_param
    assert_response :success
  end

  test "should update config_file" do
    put :update, :id => config_files(:one).to_param, :config_file => { }
    assert_redirected_to config_file_path(assigns(:config_file))
  end

  test "should destroy config_file" do
    assert_difference('ConfigFile.count', -1) do
      delete :destroy, :id => config_files(:one).to_param
    end

    assert_redirected_to config_files_path
  end
end
