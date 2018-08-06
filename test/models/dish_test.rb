require 'test_helper'
require 'pry'

class DishTest < ActiveSupport::TestCase
  def setup
    @restaurant = restaurants(:dajiale)
    @dish = dishes(:tofu)
  end

  test "should be valid" do
    assert @dish.valid?
  end

  test "name should be present" do
    @dish.name = "  "
    assert_not @dish.valid?
  end

  test "description should be present" do
    @dish.description = "  "
    assert_not @dish.valid?
  end

  test "restaurant must be present" do
    @dish.restaurant = nil
    assert_not @dish.valid?
  end

  context "associations" do
    should belong_to(:restaurant)
  end


end
