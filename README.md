# Best Restaurants

This (ongoing) webapp stores a list of the user's favourite restaurants, along with recommended dishes and address information pulled from the GoogleMaps API.

## Checklist / How-To

- Create two models - restaurants and dishes - along with the relevant attributes for each.

- Create a has_many / belongs_to association between them by a) editing each model file, and b) editing the DB migration file for the dish model to include this line:
```
t.belongs_to :restaurant, index: true
```

- Then run the DB migration. Add any validations to the models, and write basic tests for the validations.


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
