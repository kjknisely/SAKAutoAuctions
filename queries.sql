/* 
1. Multiple 
 Return the Name and Salary of All employees who are Auctioneers.
*/
select name, salary
from Employee, Auctioneer
where assn = ssn;

/*
# 2. Corrollated 
# Return Make and model of vehicles that are in lot #3 with less than 10,000 miles.
*/
select make,model
from Auction_Automobile a1
where a1.mileage < 10000 and a1.year in 
(select year 
from Auction_Automobile a2, Location
where lot_number='3');

/*
# 3. Uncorrolated Nested
# Return addresses of all employees who are drivers. 
*/
select address 
from Employee e1
where e1.ssn in (select ssn
from Employee, Driver
where ssn=dssn);

/*
#4. Query using MINUS
# Return ssn's of employees who are NOT drivers.
*/
select ssn 
from Employee
MINUS
select ssn
from Employee, Driver
where ssn=dssn;

/*
# 5. Query using in
# Return Make, Model, and Color of all vehicles that are located on Lot 2
*/
select Make, Model, color 
from Auction_Automobile a1
where a1.lot_num in (select lot_num
from Auction_Automobile
where lot_num='2');

/*
# 6. Query using group by and aggregate and having
# Return a count of each vehicle make that is listed in the roster 
with more than 10 of those cars
*/
select make, count(*)
from Auction_Automobile a1
group by make
having count(*) > 10;

/*
# 7. Query using INTERSECT
# Return names of Owners whose vehicles are on lot #4 and their titles are CLEAN 
*/
SELECT vin, owner FROM Auction_Automobile WHERE title = 'clean'
INTERSECT
select vin, owner from auction_automobile where lot_num = '4';

/*
# 8. Query using UNION
# Return unique VINs of vehicles manufactured by Toyota or vehicles with automatic 
transmission
*/
SELECT VIN FROM Auction_Automobile WHERE make = 'Toyota'
UNION
select VIN from auction_automobile where trans = 'auto';

/*
# 9. Query using sort by (ORDER BY)
# Return names and addresses for all employees whose salary is greater than $90,000
*/
select name, address
from Employee
where salary > 90000
ORDER by name;

/*
# 10. Query using all
# Return make and model of all vehicles if all titles are clean. 
*/
select make, model
from Auction_Automobile
where title = all (select title 
from Auction_Automobile
where title = 'clean');

/* 
11. not in
 Return the Name of all employees who are not Auctioneers.
*/

select name
from Employee
where ssn not in (select assn
                  from Auctioneer);

/*
12. exists
 Return the lot number of lots with unnknown owner cars
*/

select lot_number
from Location
where exists (select *
              from Auction_Automobile
              where owner is Null);

/*
13. not exists
 Return the vin, make, model, and year of cars with more than 245,000 miles
*/

select vin, make, model, year
from Auction_Automobile as aa1
where not exists (select *
                  from Auction_Automobile as aa2
                  where aa1.vin = aa2.vin and mileage < 245000);

