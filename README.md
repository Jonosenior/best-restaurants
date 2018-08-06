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

- 
