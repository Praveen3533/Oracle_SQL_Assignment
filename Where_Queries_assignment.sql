desc sh.CUSTOMERS

-- 1. Find customers born after the year 1990.
select CUST_ID,
     CUST_Year_of_birth 
from sh.CUSTOMERS 
where CUST_Year_of_birth > 1990;

--2. List all male customers (`CUST_GENDER = 'M'`).
select CUST_ID,
    CUST_GENDER 
from sh.CUSTOMERS 
where CUST_GENDER = 'M';

--3. Retrieve all female customers (`CUST_GENDER = 'F'`) living in Sydney.
select CUST_ID,
      CUST_GENDER, 
      CUST_CITY 
from sh.CUSTOMERS 
where CUST_GENDER = 'F' 
AND CUST_CITY = 'Sydney';

--4. Find customers with income level `"G: 130,000 - 149,999"`.
select CUST_ID,
      CUST_INCOME_LEVEL 
from sh.CUSTOMERS 
where CUST_INCOME_LEVEL = 'G: 130,000 - 149,999';

--5. Get all customers with a credit limit above 10,000.
Select CUST_ID,
       CUST_CREDIT_LIMIT 
from sh.customers 
where CUST_CREDIT_LIMIT > 10000; 

--6. Retrieve customers from the state "California".
select CUST_ID,
      CUST_STATE_PROVINCE 
from sh.CUSTOMERS 
where CUST_STATE_PROVINCE  = 'California' ;

--7. Find customers who have provided an email address.
select CUST_ID,
      CUST_EMAIL
from sh.Customers
where CUST_EMAIL IS NOT NULL;

--8. List customers with missing marital status.
select CUST_ID,
      CUST_MARITAL_STATUS 
from sh.Customers
where CUST_MARITAL_STATUS IS NULL;

--9. Find customers whose postal code starts with "53".
select CUST_ID,
      CUST_POSTAL_CODE
from sh.Customers
where CUST_POSTAL_CODE like '53%';

--10. Get customers born before 1980 with a credit limit above 5,000.
select CUST_ID,
       CUST_YEAR_OF_BIRTH,
       CUST_CREDIT_LIMIT  
from sh.Customers
where CUST_YEAR_OF_BIRTH <1980 
 AND CUST_CREDIT_LIMIT > 5000;

-- 11. Retrieve customers from Almere or Amersfoort.
SELECT CUST_ID,
       CUST_CITY
FROM sh.Customers
WHERE CUST_CITY IN ('Almere', 'Amersfoort');

-- 12. Find customers who do not have a credit limit.
select CUST_ID,
       CUST_CREDIT_LIMIT  
from sh.Customers
where CUST_CREDIT_LIMIT IS NULL ;

-- 13. List customers whose phone number starts with "487".
select CUST_ID,
      CUST_MAIN_PHONE_NUMBER 
from sh.Customers
where CUST_MAIN_PHONE_NUMBER  like '487%';

-- 14. Find married customers with income level `"Medium"`.
select CUST_ID,
      CUST_MARITAL_STATUS,
      CUST_INCOME_LEVEL    
from sh.Customers
where  CUST_MARITAL_STATUS = 'Married'
  AND CUST_INCOME_LEVEL = 'Medium' ;

-- 15. Get customers whose last name starts with "G".
select CUST_ID,
      CUST_FIRST_NAME,
      CUST_LAST_NAME
from sh.Customers
where CUST_LAST_NAME LIKE 'G%';

-- 16. Find customers with city_id = 51057.
select CUST_ID,
      CUST_CITY_ID 
from sh.Customers
where CUST_CITY_ID = 51057 ;

-- 17. Retrieve all customers who are valid (`CUST_VALID = 'A'`).
select CUST_ID,
      CUST_VALID
from sh.Customers
where CUST_VALID = 'A' ;

-- 18. Find customers whose effective start date (`CUST_EFF_FROM`) is after 2020.
select CUST_ID,
      CUST_EFF_FROM
from sh.Customers
where CUST_EFF_FROM > DATE '2020-12-31';

-- 19. Retrieve customers whose effective end date (`CUST_EFF_TO`) is before 2021.
select CUST_ID,
      CUST_EFF_TO 
from sh.Customers
where CUST_EFF_TO < DATE '2021-01-01'

-- 20. Find customers with credit limit between 5,000 and 9,000.
select CUST_ID,
       CUST_CREDIT_LIMIT  
from sh.Customers
where CUST_CREDIT_LIMIT BETWEEN 5000 AND 9000 ;

-- 21. Get all customers from country_id = 101.
select CUST_ID,
      COUNTRY_ID   
from sh.Customers
where COUNTRY_ID = 101 ;

-- 22. Find customers whose email ends with `"@company.example.com"`.
select CUST_ID,
     CUST_EMAIL 
from sh.Customers
where CUST_EMAIL LIKE '%@company.example.com';

-- 23. List customers with `CUST_TOTAL_ID = 52772`.
select CUST_ID,
      CUST_TOTAL_ID 
from sh.Customers
where CUST_TOTAL_ID = 52772;

-- 24. Find customers with `CUST_SRC_ID` in (10, 20, 30).
select CUST_ID,
      CUST_SRC_ID 
from sh.Customers
where CUST_SRC_ID IN (10, 20, 30);

-- 25. Retrieve customers who either do not have email or do not have a credit limit.
select CUST_ID,
      CUST_EMAIL,
      CUST_CREDIT_LIMIT 
from sh.Customers
where CUST_EMAIL IS NULL
   OR CUST_CREDIT_LIMIT IS NULL;