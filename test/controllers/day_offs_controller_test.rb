require 'test_helper'

class DayOffsControllerTest < ActionController::TestCase
  setup do
    @day_off = day_offs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_offs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_off" do
    assert_difference('DayOff.count') do
      post :create, day_off: { date: @day_off.date, name: @day_off.name }
    end

    assert_redirected_to day_off_path(assigns(:day_off))
  end

  test "should show day_off" do
    get :show, id: @day_off
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_off
    assert_response :success
  end

  test "should update day_off" do
    patch :update, id: @day_off, day_off: { date: @day_off.date, name: @day_off.name }
    assert_redirected_to day_off_path(assigns(:day_off))
  end

  test "should destroy day_off" do
    assert_difference('DayOff.count', -1) do
      delete :destroy, id: @day_off
    end

    assert_redirected_to day_offs_path
  end
end
