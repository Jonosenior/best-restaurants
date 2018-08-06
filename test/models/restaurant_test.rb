require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  def setup
    @dish = dishes(:tofu)
    @restaurant = restaurants(:dajiale)
  end

  test "should be valid" do
    assert @restaurant.valid?
  end

  test "name should be present" do
    @restaurant.name = "   "
    assert_not @restaurant.valid?
  end

  test "description should be present" do
    @restaurant.description = "   "
    assert_not @restaurant.valid?
  end

  test "address should be present" do
    @restaurant.address = "   "
    assert_not @restaurant.valid?
  end

  test "cuisine should be present" do
    @restaurant.cuisine = "   "
    assert_not @restaurant.valid?
  end

  test "dishes should be present" do
    assert @restaurant.dishes.include? @dish
  end

  context "associations" do
    should have_many(:dishes)
  end

end
