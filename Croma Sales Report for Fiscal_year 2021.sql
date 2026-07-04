# Croma India Product wise Sales report for fiscal year 2021
-- The report should have following fields 
-- Month
-- Product name
-- Variant
-- Sold Quantity
-- Gross Price per item
-- Gross price Total 

select * from dim_customer 
where customer like '%croma%' and market = 'india';

select * from fact_sales_monthly
where customer_code = '90002002';

-- Convert Clanedar Year to Fiscal Year 

Select 
s.date, 
s.fiscal_year,
s.product_code,
c.market,
s.customer_code,
p.product, 
p.variant,
s.sold_quantity,
g.gross_price as gross_price_per_item,
round(g.gross_price*s.sold_quantity,2) as gross_price_total,
pre.pre_invoice_discount_pct

from fact_sales_monthly s
join dim_customer c ON s.customer_code = c.customer_code
join dim_product p
on s.product_code = p.product_code

join fact_gross_price g
on g.product_code = s.product_code and
g.fiscal_year = s.fiscal_year

join fact_pre_invoice_deductions pre
on pre.customer_code = s.customer_code and
pre.fiscal_year = s.fiscal_year

where s.fiscal_year= 2021
limit 1000000

