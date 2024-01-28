# -----------------------------------------------------------------------------------------
# As customer I should be able to search for a dish so I can find my desired dish.
Feature: Search and Filtering (Menu Management)

  Scenario: Customer Searches and Filters Across Dishes
    Given the customer, user "Alex," is exploring the platform's menu section
    And is on the search dishes page

    When Alex searches for dishes containing the keyword "Vegan" across all restaurants
    Then the application should present a refined list of vegan dishes from various restaurants
    And each displayed dish should include details like the name, description, price, and the respective restaurant offering it

    When Alex further refines the search by applying filters for "Main Courses" and "Gluten-free"
    Then the application should display only gluten-free main courses from different restaurants
    And each filtered item should provide relevant details

    When Alex decides to clear the applied filters
    Then the application should revert to presenting the complete menu across all restaurants
    And all menu items, spanning main courses and vegan dishes, should be visible

# ------------------------------------------------------------------------------------------
# As a customer I should be able to see my previous orders so I can see my older orders.
Feature: View Order History (Customer Management)

Scenario: Customer wants to view older orders and details
    Given the customer is logged into their account
    When the customer is on the "Order History" section
    Then the system should present a comprehensive list of the customer's past orders

    And each order in the list should include:
      * Order date
      * Items ordered
      * Total price

    And the order history should be organized chronologically, with the latest orders appearing first
    And the customer should have the option to click on each order to view additional details

# --------------------------------------------------------------------------------------------------
# As employee I should be able to add new dish that customers can choose from.
Feature: Update Menu (Restaurant Management)

  Scenario: Restaurant owner or staff adds a new dish to the menu
    Given the restaurant staff, user "Lee," is logged into the restaurant management platform
    And navigates to the menu management section

    When Lee adds a new dish, "Grilled Salmon Salad," to the menu
    And specifies details such as a description
    And price
    And available dietary options
    And assigns the dish to the existing category "Salads"

    Then the application should validate the new dish details for completeness
    And update the restaurant's menu with the "Grilled Salmon Salad"
    And display the updated menu with the new item to customers browsing the restaurant's offerings

    And Lee receives a confirmation message indicating the successful addition of "Grilled Salmon Salad" to the menu
    And the application logs the menu update with a timestamp for auditing purposes

# ---------------------------------------------------------------------------------------------------
# As employee I should be able to confirm an order so customer’s order get processed.
Feature: Confirm Order (Order management)

  Scenario: Restaurant staff confirms an incoming order
    Given the restaurant has received a new order with order ID "12345" from customer "Florinel"
    And the order includes items like "Margherita Pizza" and "Chocolate Fondant"
    And the current order status is "Pending Confirmation"

    Given the restaurant staff, user "Lee" is logged in
    And is in the order management section
    And search the new order with ID "12345"
    And confirms the order for preparation

    Then the application should update the order status for order ID "12345" to "Confirmed"
    And send a confirmation notification to the customer "Florinel"
    And trigger the kitchen display system to prepare the confirmed order items


# Simple version

"""Feature: Staff Log-in (Restaurant Management)

  Scenario: Restaurant Staff Logs In to the Platform
    Given the restaurant owner or staff member intends to access the restaurant management platform
    When they navigate to the login page
    And enter their ID-number and password
    Then the application authenticates the restaurant staff's identity
    And grants access to the management dashboard"""


