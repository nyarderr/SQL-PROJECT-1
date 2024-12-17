# SQL-PROJECT-1
**Problem Statement:**
You are a database administrator. You want to use the data to answer a few questions
about your customers, especially about the sales and profit coming from different
states, Money spent in marketing and various other
factors such as COGS, Budget profit etc. You plan on using these insights to help him
decide whether which items is being sold most Additionally he needs help to generate
some basic datasets so his team can easily inspect the data without needing to use
SQL.
You have provided the sample of his overall customer data due to privacy issues – but
you hope that these samples are enough for you to write fully functioning SQL queries
to help him answer his questions.
Dataset :
The 3 key datasets for this case study:
• FactTable:
The FactTable has 13 columns mentioned below and 4200 rows.
Profit, Margin, Sales, COGS, Total Expenses, Marketing, Inventory, Budget, Profit,
Budget COGS, Budget Margin, Budget Sales, Area Code, and ProductID Note -
COGS stands for Cost of Goods Sold.
• ProductTable
The ProductTable has four columns named Product Type, Product, ProductId, and
Type. It has 13 rows, which can be broken down into further details to retrieve the
information mentioned in the FactTable.
• Location Table
Finally, the Location Table has 156 rows and follows a similar approach to
ProductTable and has four columns named Area Code, State, Market, and Market
Size.

**QUESTIONS**
1. How many products are of regular type ?
2. Display the average inventory for each product id.
3.Display state in a sequential order in a location table.
4. Display the average budget margin of the store where average budget margin
should be greater than 100.
5. What is the total sales done on date 2010-01-01
6. Display the average total expense of each product id on individual date
7. Display the table with the following attributes such as Date, productid,
product_type, product, Sales, profit, state, area_code.
8. Display the rank without any gap to show the Sales wise rank.
9. Find the State wise Profit and Sales.
10. If there is an increase in sales of 5%. Calculate the increased sales.
11. Find the maximum profit along with the Product id and Product Type.
12. Create a Stored Procedure to fetch the result according to the product type from
Product.
13. Write a query by creating a condition in which if the total expenses is less than
60 then it is a profit or else loss.
14. Give the total weekly sales value with the Date and productid details. Use
roll-up to pull the data in hierarchical order.
15. Apply union and intersection operator on the tables which consist of attribute
area code.
16. Create a user-defined function for the product table to fetch a particular product
type based upon the user’s preference.
17. Change the product type from coffee to tea where product id is 1 and undo it.
18. Display the Date, productid and sales where total expenses are between 100 to
200.
