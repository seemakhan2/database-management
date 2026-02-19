Scenario: 

This databasse is based off of an online store - Customers place Orders. Each order contains Products, where the quantity and price_at_purchase is 
tracked for each order item. 


Summary of Design: 
The ER Diagram consist of three primary entity sets and one join table. 

1) Customer Table: This stores the user (Customer) data. The customer_ID is a primary key. 

2) Order Table: Tracks individual transactions. It has a One-to-Many relationship with Customers, as one customer can place multiple orders. 
                It contains a Foreign Key (customer_id) to link the order back to the buyer. 

3) Product Table: Keeps inventory. It includes product_name and product_description. I allowed product_description to be NULL to satisfy the lab's requirements. 

4) Order_items: This resolves the Many-to-Many relationship between Orders and Products.

                 Primary Key: A composite key consisting of (order_id, product_id).

                 Relationship Attributes: I stored quantity and price_at_purchase here. This is stores here because they are specific to a product in the order -
                                          the price_at_purchase in this join table acts as a permanent "receipt" of what was paid at that moment.


How to Run Lab3.SQL: 
- open the pgAdmin
- create the database
- connect to database
- read throught the comments!! The comments seperate each different part. 
- copy and paste the content into different query windows. 
