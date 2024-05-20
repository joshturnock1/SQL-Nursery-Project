# SQL-Project

### Project overview
You have been hired as a consultant to create a database for a wholesale nursery
company. The company, Onarga Nursery, sells all types of plants, including shrubs and
trees, and also performs a variety of landscape architecture services (such as planting
trees, creating hedges, commercial designing, etc). 
the script to create the tables and insert the data has been provided.Using the created DB, do the following
queries; mark each query with an --A or --B etc.

--A. Display the category name and plant name, but display every row of the category
table (every category name in the category table).

--B. Display plant name, category name and in stock quantity for all “trees” (any category
name that has the word “tree” in its name); sort by in stock quantity.

--C. Display employee last name, date hired, length of time worked, and plant name for
all employees who were hired since the year 2015 (or later) or whose last name starts
with an M. Sort by date hired, newest (the last one hired) to oldest.

--D. Display distinct employee last name, sale date, and “Due Date”, a new field that
adds 30 days to the sale date and gives a new date (when the invoice is due). Sort by sale
date.

--E. Display service name and “Average Cost”, a calculated field that averages the labor
costs for all services where the average labor costs are less than $20 per hour. Group by
service name.

--F. Display last name, labor cost, and a calculated field called “New Costs” which
displays a revised labor cost which is 5/3 the amount of the old labor cost. Ensure the
revised labor costs is accurate to exactly three decimals.


--G. Display plant name, sale date, sale quantity and category type for all sales where the
sale item is a tree. Use a nested query.

--H. Display the number of sales transactions (must use a query).

--I. Display service name (column named “Name of Service”) and the minimum, average,
and maximum labor cost. Group by service name. [Yes, the min/max/averages are all
the same, because our DB is small]

--J. We want to see the average of labor costs that belong to the services of planting. Use
a pivot query that pivots on service name and uses the two services of tree planting and
hedge planting.
