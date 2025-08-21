-- Queries on Star Schema

-- Sales by Category
select p.Category, SUM(s.Sales) as total_sale
from Sales as s
inner join Products as p on s.Product_ID=p.Product_ID
group by p.Category;

-- Sales by Customer Segment
select c.Segment, SUM(s.Sales) as total_sale
from Sales as s
inner join Customer as c on s.Customer_ID=c.Customer_ID
group by c.Segment
order by c.Segment desc;

-- Sales by Region
select O.Region, SUM(s.Sales) as total_sale
from Sales as s
inner join Orders as O on s.Order_ID=O.Order_id
group by O.Region;

-- Sales by Year
select Year(O.Order_Date) as years,
		SUM(s.Sales) as total_sale 
from Orders as O
inner join Sales as s on O.Order_id=s.Order_ID
group by Year(O.Order_Date)
order by Year(O.Order_Date) asc;

-- maximum sale month of each year
with montlysales as (
select YEAR(O.Order_Date) as years,
		MONTH(O.Order_Date) as mnth,
		SUM(s.Sales) as total_sale
from Orders as O
inner join Sales as s on O.Order_id=s.Order_ID
group by YEAR(O.Order_Date), MONTH(O.Order_Date)
)
select m.*
from montlysales as m
join (
select years, MAX(total_sale) as max_sale
from montlysales
group by years
) as x on m.years=x.years AND m.total_sale=x.max_sale;
