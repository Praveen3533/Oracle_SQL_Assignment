-- 1. Assign row numbers to customers ordered by credit limit descending.
select  row_number() over(order by cust_credit_limit  desc) as row_num, cust_credit_limit from sh.customers

-- 2. Rank customers within each state by credit limit.
select cust_state_province, cust_credit_limit, rank() over (partition by cust_state_province order by cust_credit_limit desc) as rank_cust from sh.customers

-- 3. Use DENSE_RANK() to find the top 5 credit holders per country.
select * from( 
select country_id, cust_credit_limit, dense_rank() over (partition by country_id order by  cust_credit_limit desc) as top_ranks  from sh.customers) 
where top_ranks <= 5;

-- 4. Divide customers into 4 quartiles based on their credit limit using NTILE(4).
select cust_credit_limit,ntile(4) over(order by cust_credit_limit desc) as quartiles from sh.customers

-- 5. Calculate a running total of credit limits ordered by customer_id.
select cust_id,cust_credit_limit, sum(cust_credit_limit) over(order by cust_id ) as total_credit_limit from sh.customers

-- 6. Show cumulative average credit limit by country.
select country_id, cust_id, cust_credit_limit, avg(cust_credit_limit) over (partition by country_id order by cust_id  rows between unbounded preceding and current row) as cumulative_average from sh.customers

-- 7. Compare each customer’s credit limit to the previous one using LAG().
select cust_id,cust_credit_limit, lag(cust_credit_limit, 1) over(order by cust_id  desc) as previous_limit from sh.customers

-- 8. Show next customer’s credit limit using LEAD().
select cust_id, cust_credit_limit, lead(cust_credit_limit, 1) over(order by cust_id ) as next_limit  from sh.customers

-- 9. Display the difference between each customer’s credit limit and the previous one.
select cust_id,cust_credit_limit, lag(cust_credit_limit, 1) over(order by cust_id ) as previous_limit, cust_credit_limit - lag(cust_credit_limit )over(order by cust_id ) as previous_difference from sh.customers

-- 10. For each country, display the first and last credit limit using FIRST_VALUE() and LAST_VALUE().
select country_id, cust_credit_limit, first_value(cust_credit_limit) over(partition by country_id order by cust_credit_limit  asc rows between unbounded preceding and unbounded following) as first_credit_limit,
last_value(cust_credit_limit) over(partition by country_id order by cust_credit_limit  asc rows between unbounded preceding and unbounded following) as last_credit_limit from sh.customers

-- 11. Compute percentage rank (PERCENT_RANK()) of customers based on credit limit.
select  cust_credit_limit, percent_rank() over ( order by cust_credit_limit desc) as precentage_credit from sh.customers 

-- 12. Show each customer’s position in percentile (CUME_DIST() function).
select cust_credit_limit, cume_dist() over (order by cust_credit_limit ) as percentile_position from sh.customers 

-- 13. Display the difference between the maximum and current credit limit for each customer.
select cust_credit_limit, max(cust_credit_limit) over() - cust_credit_limit as difference_from_maximum from sh.customers

-- 14. Rank income levels by their average credit limit.
SELECT DISTINCT cust_income_level,average_credit,RANK() OVER (ORDER BY average_credit DESC) AS rank_average
FROM (SELECT cust_income_level,AVG(cust_credit_limit) OVER (PARTITION BY cust_income_level) AS average_credit
FROM sh.customers) 
ORDER BY rank_average;

-- 15. Calculate the average credit limit over the last 10 customers (sliding window).
select cust_id, cust_credit_limit, avg(cust_credit_limit)over(order by cust_id rows between 9 preceding and current row) as avg_last_10_rows from sh.customers order by cust_id

