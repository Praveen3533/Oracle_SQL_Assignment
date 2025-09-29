-- desc SH.CUSTOMERS

-- select * from  sh.CUSTOMERS

--  25 Questions on GROUP BY and HAVING.

-- 26. Count the number of customers in each city.
select cust_city, count(*)
from sh.customers
group by cust_city;

-- 27. Find cities with more than 100 customers.
select cust_city, count(*)
from sh.customers
group by cust_city having count(*)>100;

-- 28. Count the number of customers in each state.
select CUST_STATE_PROVINCE, count(*)
from sh.customers
group by CUST_STATE_PROVINCE;

-- 29. Find states with fewer than 50 customers.
select CUST_STATE_PROVINCE, count(*)
from sh.customers
group by CUST_STATE_PROVINCE having count(*)<50;

-- 30. Calculate the average credit limit of customers in each city.
select cust_city, avg(cust_credit_limit)
from sh.customers
group by cust_city;

-- 31. Find cities with average credit limit greater than 8,000.
select cust_city, avg(cust_credit_limit)
from sh.customers
group by cust_city having avg(cust_credit_limit)>8000;

-- 32. Count customers by marital status.
select cust_marital_status, count(*)
from sh.customers
group by cust_marital_status;

-- 33. Find marital statuses with more than 200 customers.
select cust_marital_status, count(*)
from sh.customers
group by cust_marital_status having count(*)>200;

-- 34. Calculate the average year of birth grouped by gender.
select cust_gender, avg(cust_year_of_birth)
from sh.customers
group by cust_gender;

-- 35. Find genders with average year of birth after 1990.
select cust_gender, avg(cust_year_of_birth)
from sh.customers
group by cust_gender having avg(cust_year_of_birth)>1990;

-- 36. Count the number of customers in each country.
select country_id, count(*)
from sh.customers
group by country_id;

-- 37. Find countries with more than 1,000 customers.
select country_id, count(*)
from sh.customers
group by country_id having count(*)>1000;

-- 38. Calculate the total credit limit per state.
select CUST_STATE_PROVINCE, sum(cust_credit_limit)
from sh.customers
group by CUST_STATE_PROVINCE;

-- 39. Find states where the total credit limit exceeds 100,000.
select CUST_STATE_PROVINCE, sum(cust_credit_limit)
from sh.customers
group by CUST_STATE_PROVINCE having  sum(cust_credit_limit)>100000 ;

-- 40. Find the maximum credit limit for each income level.
select Cust_income_level, max(cust_credit_limit)
from sh.customers
group by Cust_income_level;

-- 41. Find income levels where the maximum credit limit is greater than 15,000.
select Cust_income_level, max(cust_credit_limit)
from sh.customers
group by Cust_income_level having max(cust_credit_limit)>15000;

-- 42. Count customers by year of birth.
select cust_year_of_birth, count(*)
from sh.customers
group by cust_year_of_birth ;

-- 43. Find years of birth with more than 50 customers.
select cust_year_of_birth, count(*)
from sh.customers
group by cust_year_of_birth having count(*)>50 ;

-- 44. Calculate the average credit limit per marital status.
select cust_marital_status, avg(cust_credit_limit)
from sh.customers
group by cust_marital_status;

-- 45. Find marital statuses with average credit limit less than 5,000.
select cust_marital_status, avg(cust_credit_limit)
from sh.customers
group by cust_marital_status having avg(cust_credit_limit)<5000;

-- 46. Count the number of customers by email domain (e.g., `company.example.com`).
select cust_email, count(*)
from sh.customers
group by cust_email ;

-- 47. Find email domains with more than 300 customers.
select cust_email, count(*)
from sh.customers
group by cust_email having count(*)>300;

-- 48. Calculate the average credit limit by validity (`CUST_VALID`).
select cust_valid, avg(cust_credit_limit)
from sh.customers
group by cust_valid;

-- 49. Find validity groups where the average credit limit is greater than 7,000.
select cust_valid, avg(cust_credit_limit)
 from sh.customers 
 group by cust_valid having avg(cust_credit_limit)>7000;

-- 50. Count the number of customers per state and city combination where there are more than 50 customers.
select cust_city,cust_state_province, count(*)
from sh.customers
group by cust_city,cust_state_province having count(*)>50;