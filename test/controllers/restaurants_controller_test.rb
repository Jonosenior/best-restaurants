require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @dajiale = restaurants(:dajiale)
    @restaurants = Restaurant.all
  end

  test "should get index" do
    get restaurants_path
    assert_response :success
  end

  test "index contains names of existing restaurant" do
    get restaurants_path
    assert_select "div", { html: /Da Jia Le/ }, "Existing restaurants should appear"
  end

  test "should get show" do
    get restaurants_path(@dajiale.id)
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_path
    assert_response :success
  end

  test "should destroy and redirect" do
    assert_difference 'Restaurant.count', -1 do
      delete restaurant_path(@dajiale.id)
    end
    assert_redirected_to root_url
  end

  # test "should create restaurant" do
  #   # get new_restaurant_path
  #   assert_difference('Restaurant.count') do
  #     # post new_restaurant_path(id: 152349817)
  #     post restaurant_path, name: "Da Jia Le",
  #                      address: "new@new.new",
  #                      cuisine: "first",
  #                      description: "last",
  #                      id: 2
  #   end
  #   assert_redirected_to restaurant_path(@dajiale)
  # end


end
