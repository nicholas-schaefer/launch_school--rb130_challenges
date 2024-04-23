require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/robot_challenge.rb'

Minitest::Reporters.use!

=begin
When robots come off the factory floor, they have no name.
The first time you boot them up, a random name is generated,
  - such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings,
which means that their name gets wiped.
The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence.
Random names means there is a risk of collisions.
Your solution should not allow the use of the same name twice.
=end

class RobotTest < Minitest::Test
  DIFFERENT_ROBOT_NAME_SEED = 1234
  SAME_INITIAL_ROBOT_NAME_SEED = 1000

  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def test_has_name
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    #skip
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    #skip
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    #skip
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    refute_equal name, name2
    assert_match NAME_REGEXP, name2
  end

  def test_different_name_when_chosen_name_is_taken
    #skip
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name1 = Robot.new.name
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name2 = Robot.new.name
    refute_equal name1, name2
  end
end
