require 'test_helper'

class CalendarTypesControllerTest < ActionController::TestCase
  setup do
    @calendar_type = calendar_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar_type" do
    assert_difference('CalendarType.count') do
      post :create, calendar_type: { name: @calendar_type.name }
    end

    assert_redirected_to calendar_type_path(assigns(:calendar_type))
  end

  test "should show calendar_type" do
    get :show, id: @calendar_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendar_type
    assert_response :success
  end

  test "should update calendar_type" do
    patch :update, id: @calendar_type, calendar_type: { name: @calendar_type.name }
    assert_redirected_to calendar_type_path(assigns(:calendar_type))
  end

  test "should destroy calendar_type" do
    assert_difference('CalendarType.count', -1) do
      delete :destroy, id: @calendar_type
    end

    assert_redirected_to calendar_types_path
  end
end
