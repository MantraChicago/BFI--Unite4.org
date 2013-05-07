require 'test_helper'

class CauseApplicationsControllerTest < ActionController::TestCase
  setup do
    @cause_application = cause_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cause_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cause_application" do
    assert_difference('CauseApplication.count') do
      post :create, :cause_application => {  }
    end

    assert_redirected_to cause_application_path(assigns(:cause_application))
  end

  test "should show cause_application" do
    get :show, :id => @cause_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cause_application
    assert_response :success
  end

  test "should update cause_application" do
    put :update, :id => @cause_application, :cause_application => {  }
    assert_redirected_to cause_application_path(assigns(:cause_application))
  end

  test "should destroy cause_application" do
    assert_difference('CauseApplication.count', -1) do
      delete :destroy, :id => @cause_application
    end

    assert_redirected_to cause_applications_path
  end
end
