-- 1. Show customers whose first and last name start with the same letter.
select cust_first_name, cust_last_name from sh.customers where upper(substr(cust_first_name,1,1)) = upper(substr(cust_last_name,1,1)) 

-- 2. Display full names in “Last, First” format.
select cust_first_name,cust_last_name, cust_last_name||' '|| cust_first_name as full_name from sh.customers

-- 3. Find customers whose last name ends with 'SON'.
select  cust_last_name from sh.customers where upper(substr(cust_last_name,-3,3)) ='SON' 

-- 4. Display length of each customers full name.
select cust_first_name,cust_last_name, cust_first_name ||' '|| cust_last_name as full_name, length (cust_first_name|| ' ' ||cust_last_name) as name_length from sh.customers  

-- 5. Replace vowels in customer names with '*'.
select cust_first_name,cust_last_name, regexp_replace(cust_first_name ||' '|| cust_last_name , '[AEIOUaeiou]','*') as replaced_name from sh.customers

-- 6. Show customers whose income level description contains ‘90’.
select cust_income_level from sh.customers where cust_income_level like '%90%'

-- 7. Display initials of each customer (first letters of first and last name).
select cust_first_name, cust_last_name, substr(cust_first_name,1,1)||' '|| substr(cust_last_name,1,1) as initials from sh.customers 

-- 8. Concatenate city and state to create full address.
select cust_city || ' , ' ||cust_state_province as full_address from sh.customers

-- 9. Extract numeric value from income level using REGEXP_SUBSTR.
select cust_income_level, regexp_substr(cust_income_level,'\d+,\d+') as numeric_values from sh.customers

-- 10. Count how many customers have a 3-letter first name.
select cust_first_name, count(*) as customer_name  from sh.customers where length(cust_first_name) = 3 group by cust_first_name