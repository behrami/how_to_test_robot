require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def setup
    @robotTest = Robot.new
  end

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @robotTest.needs_repairs= true
    @robotTest.foreign_model= true

    # act
    expected_value = 1
    actual_value = @robotTest.station()

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    @robotTest.needs_repairs= true
    @robotTest.vintage_model= true

    # act
    expected_value = 2
    actual_value = @robotTest.station()

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    @robotTest.needs_repairs= true
    @robotTest.vintage_model= false
    @robotTest.foreign_model= false

    # act
    expected_value = 3
    actual_value = @robotTest.station()

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    @robotTest.needs_repairs= false

    # act
    expected_value = 4
    actual_value = @robotTest.station()

    # assert
    assert_equal(expected_value, actual_value)

  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange


    # act
    expected_value = -1
    actual_value = @robotTest.prioritize_tasks

    # assert
    assert_equal(expected_value, actual_value)

  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    @robotTest.todos= ['clock in', 'repair']

    # act
    expected_value = 'repair'
    actual_value = @robotTest.prioritize_tasks

    # assert
    assert_equal(expected_value, actual_value)

  end

  def test_workday_on_day_off_returns_false
    #day off you return false

    # arrange
    @robotTest.day_off= 'sunday'

    # act
    expected_value = false
    actual_value = @robotTest.workday?('sunday')

    # assert
    assert_equal(expected_value, actual_value)

  end

  def test_workday_not_day_off_returns_true
    #workday return true

    # arrange
    @robotTest.day_off= 'sunday'

    # act
    expected_value = true
    actual_value = @robotTest.workday?('monday')

    # assert
    assert_equal(expected_value, actual_value)

  end

end
