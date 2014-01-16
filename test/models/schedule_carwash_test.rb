require 'test_helper'

class ScheduleCarwashTest < ActiveSupport::TestCase

  def setup
    @carwash = schedule_carwashes(:one)
  end


  test "kind of properties" do
    assert_kind_of Date, @carwash.date
    assert_kind_of Integer, @carwash.turn
    assert_kind_of Employee, @carwash.employee
  end

  test "presence of date" do
    @carwash.date = nil
    refute @carwash.save
  end

  test "presence of turn" do
    @carwash.turn = nil
    refute @carwash.save
  end

  test "presence of employee" do
    @carwash.employee = nil
    refute @carwash.save
  end

  test "it belongs to employee" do
    assert_kind_of Employee, @carwash.build_employee
  end

  test "one carwash for employee by day" do
    second = schedule_carwashes(:two)
    second.date = @carwash.date
    second.employee = @carwash.employee
    refute second.save
  end

end
