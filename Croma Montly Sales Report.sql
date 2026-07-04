-- Monthly Sales Report for Croma 
-- The report should have the following fields
-- 1. Month
-- 2. Total gross sales amount to Croma India in this month

Select s.date,
sum(g.gross_price*s.sold_quantity) as total_gross_price
from fact_sales_monthly s
join fact_gross_price g
on g.product_code = s.product_code and
g.fiscal_year = get_fiscal_year(s.date)
where customer_code = '90002002'
group by s.date
order by s.date asc

