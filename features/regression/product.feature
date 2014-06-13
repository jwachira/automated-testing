Feature: Products are key to our success.
  We need to be able to manage our product data.

  Scenario: Create a new product
    Given We are viewing the product listing
    And We wish to enter a new product
    When The following product is entered
      | title       | Product A       |
      | description | A great product |
    Then I should see the product listed
      | title       | Product A       |
      | description | A great product |

  Scenario: View a list of products
    Given A handful of products
      | title         | description                              |
      | Tiddly Winks  | A fun game -- with manhole covers        |
      | Pickup Sticks | See who has better hand-eye coordination |
    When We are viewing the product listing
    Then I should see the products
      | title         | description                              |
      | Tiddly Winks  | A fun game -- with manhole covers        |
      | Pickup Sticks | See who has better hand-eye coordination |