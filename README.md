# Best Restaurants

This (ongoing) webapp stores a list of the user's favourite restaurants, along with recommended dishes and address information pulled from the GoogleMaps API.

## Features

The following features will all be covered by tests:

- User gets a list of restaurants with name, address, and cuisine type.
- User sees a google maps view and can see restaurant details by clicking on the markers.
- User gets a list of the dishes when opening the page of a restaurant.
- User can insert new restaurants.
- User can insert new dishes.

## Checklist / How-To

- Create two models - restaurants and dishes - along with the relevant attributes for each.

- Create a has_many / belongs_to association between them by a) editing each model file, and b) editing the DB migration file for the dish model to include this line:
```
t.belongs_to :restaurant, index: true
```

- Then run the DB migration. Add any validations to the models (eg to ensure an instance of Restaurant must have a name, an address, etc), and write basic tests for the validations.

- Fixtures are stub objects that provide basic data to run tests against. Basic fixtures of your models are created automatically in the test/fixtures/files folder. These can be instantiated in your test file like so (here, tofu is the name of a dish fixture):
```
def setup
  @dish = dishes(:tofu)
  @restaurant = restaurants(:dajiale)
end
```  

- Create a Controller for the Restaurants model, and add corresponding routes in the config/routes.rb file (use 'resources :restaurants' to add all seven possible routes). Write basic tests for the Controller actions - check that the index action forwards you to a webpage which contains the names of all restaurants, for example, or that the #show action path gets a successful response.

- Now, you want to structure your Dish controller and routes so that they reflect the belongs_to relationship with the Restaurant model. For routes, that means nesting the resources, like so:
```
resources :restaurants do
  resources :dishes
end
```
This ensures that the dependent relationship is reflected in the URLs, so that the dish URL requires a Restaurant. eg, the URL for creating a new dish (dishes#create in the Controller) looks like this:
```
POST /restaurants/:restaurant_id/dishes(.:format)
```

- The controller logic for creating a new dish also has to account for the fact that a dish always belongs to a restaurant:
```
def create
  @restaurant = Restaurant.find(params[:id])
  @dish = @restaurant.dishes.create(dish_params)
end
```

- Since dishes always belong to a restaurant, it makes sense to list them in a restaurant's view. We can do this by adding the following code to the restaurant#show action in the controller:

```
@dishes = @restaurant.dishes
```

Then we can iterate over @dishes in the view.

-

## Problems and Solutions

- Issue: How to test for associations?
  Solution: The Shoulda gem makes this easy. Add it to the Gemfile, then you can write:
  ```
  should have_many(:dishes)
  ```

  - Issue: How exactly do you set up your fixtures? How do you make an association between two fixtures?
  Solution: For reference, this is how my 2 fixtures look (the first is located in the dish fixtures file, the second in the restaurants fixtures file). Importantly, the Dish fixture references the Restaurant fixture simply by name. Rails knows there is an association there, so you don't need to mess around manually finding the object_id of the fixture you're trying to link to. Link to it by the name of the fixture.
  ```
  tofu:
    name: Tofu Leaf Salad
    description: Sweet, sour and hot - you haven't tasted anything like this before.
    restaurant: dajiale

  dajiale:
    name: Da Jia Le
    address: Goebenstraße 23, 10783 Berlin
    cuisine: Chinese
    description: Probably the best [...]
  ```

  - Issue: The list of dishes belonging to a restaurant wasn't appearing on that restaurant's view. The problem was that I had used '<% %>' to embed the Ruby, rather than '<%= %>'. Stupid mistake!

  - UNRESOLVED ISSUE: I want add a test on my controller that a restaurant's show page contains the names of its dishes. My current code doesn't work (though the website itself does display this functionality):

  ```
  test "show restaurant should contain dishes" do
    # @dajiale.dishes.each { |a| puts a.name }
    get restaurants_path(@dajiale.id)
    assert_select "p", { html: /#{@dajiale.dishes.first.name}/ }, "A restaurant's dishes should appear on its show page"
  end
  ```
  - UNRESOLVED ISSUE: I want to add a test on my controller that the restaurant#create action actually creates a restaurant. My current code doesn't work:

  ```
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
  ```
