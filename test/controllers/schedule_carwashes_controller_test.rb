require 'test_helper'

class ScheduleCarwashesControllerTest < ActionController::TestCase
  setup do
    @schedule_carwash = schedule_carwashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_carwashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_carwash" do
    assert_difference('ScheduleCarwash.count') do
      post :create, schedule_carwash: { date: @schedule_carwash.date, turn: @schedule_carwash.turn }
    end

    assert_redirected_to schedule_carwash_path(assigns(:schedule_carwash))
  end

  test "should show schedule_carwash" do
    get :show, id: @schedule_carwash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_carwash
    assert_response :success
  end

  test "should update schedule_carwash" do
    patch :update, id: @schedule_carwash, schedule_carwash: { date: @schedule_carwash.date, turn: @schedule_carwash.turn }
    assert_redirected_to schedule_carwash_path(assigns(:schedule_carwash))
  end

  test "should destroy schedule_carwash" do
    assert_difference('ScheduleCarwash.count', -1) do
      delete :destroy, id: @schedule_carwash
    end

    assert_redirected_to schedule_carwashes_path
  end
end
