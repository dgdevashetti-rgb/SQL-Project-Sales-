-- Generate a yearly report for Croma India where there are two columns

-- 1. Fiscal Year
-- 2. Total Gross Sales amount In that year from Croma

select
get_fiscal_year(date) as fiscal_year,
sum(round(g.gross_price*s.sold_quantity,2)) as yearly_sales
from fact_sales_monthly s
join fact_gross_price g
on g.product_code = s.product_code and
g.fiscal_year = get_fiscal_year(s.date)
where customer_code = '90002002'
group by get_fiscal_year(date)
order by fiscal_year;