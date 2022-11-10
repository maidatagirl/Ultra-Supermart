# Ultra-Supermart

# Background

Ultra Supermart is an ecommerce retail industry that helps to solve the needs of the people of the United States and has sorted the help of the data science and analytics team to create a database and answer business questions that would help make informed business decisions.
We were provided with 3 csv files namely: 
- sales with columns (sales_id, order_id,	order_date,	order_priority,	order_quantity,	sales, discount, ship_mode,	profit, unit_price, shipping_cost, first_name, last_name, region, customer_segment, product_category, product_subcategory, product_container, ship_date, and birth_date).
- RegionalManager which has the name of all their managers and region they manage.
- ReturnedItem which has the id,Order_id,sales_id, and order_status that shows if an order was successfully delivered or returned.

# Methodology
- A database was created for Ultra Supermart, 3 tables were created within the database, and data was stored in the tables using the copy command method in PostgreSQL.
- Wrote SQL codes to extract data that answer business questions.

# Insights

1. The Organization is planning to gift the best performing manager who made the best sales and want to know the region which the manager belongs to?
   - The best performing manager is **Pat** and he oversees the **West** region. His region made a total sales of **$3,597,549**.
   
2. how many times was delivery truck used as the ship mode?
   - The delivery truck was used for delivery **1,146** times.
  
  
3.  How many orders were returned, and which product category got rejected the most?
    - **872** orders were returned and the most returned product category is **Office Supplies** which was returned **461** times. 


4. which Year did the company incur the least shipping cost?
   -  The least shipping cost(**$24,976**) was incurred in 2011.
   
 5. display the day of the week in which customer segment has the most sales?
    - Corporate customers has the most sales(**$933,035**) on Saturdays.
    
6. The company want to determine its profitability by knowing the actual orders that were delivered.
   -  Company made a profit of **$2,560,886** for all orders delivered.
   
   
7. The Organization is eager to know the customer names and persons born in 2011?
   - No customer was born in 2011.
   
8. what are the aggregate orders made by all the customers?
   -  Total orders made by all customers is **214,777**.


9. The company intends to discontinue any product that brings in the least profit, you are required to help the organization to determine the product?
    - The top 5 products that brings the least profit and should be discontinued are:
      -   Tables  **$-99,063**
      -   Bookcases **$-33,582**
      -   Scissors, Rulers and Trimmers **$-7,799**
      -   Rubber Bands  **$-103**
      -   Storage & Organization	**$6,664**

10. what are the top 2 best selling items that the company should keep selling?
    - 2 best selling items that generate the most income and keep selling are: 
      - Telephones and Communication **$316,952**
      - Office Machines	**$307,713**
