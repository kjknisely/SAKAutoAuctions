# 1. Multiple 
# Return the Name and Salary of All employees who are Auctioneers.
select name, salary
from employee, auctioneer
where assn = ssn;


# 2. Corrollated 
# Return Make and model of vehicles that are in lot #3 with less than 50,000 miles.

select make,model
from Auction_Automobile a1
where a1.mileage < 50000 and a1.year in 
(select year 
from Auction_Automobile a2, Location
where lot_number='3');


# 3. Uncorrolated Nested
# Return addresses of all employees who are drivers. 
select address 
from employee e1
where e1.ssn in (select ssn
from employee, driver
where ssn=dssn);


#4. Query using MINUS
# Return ssn's of employees who are NOT drivers.
select ssn 
from employee e1
MINUS
select ssn
from employee, driver
where ssn=dssn;


# 5. Query using in
# Return Make, Model, and Color of all vehicles that are located on Lot 2
select Make, Model, color 
from Auction_Automobile a1
where a1.lot_num in (select lot_num
from Auction_Automobile
where lot_num='2')

# 6. Query using group by
# Return a count of each vehicle make that is listed in the roster.
select make, count(*)
from Auction_Automobile a1
group by make
having count(*) > 10;


# 7. Query using INTERSECT
# Return names of Owners whose vehicles are on lot #4 and their titles are CLEAN 
SELECT vin, owner FROM Auction_Automobile WHERE title = 'clean'
INTERSECT
select vin, owner from auction_automobile where lot_num = '4';

# 8. Query using UNION
# Return unique VIN's of vehicles manufactured by Toyota or vehicles with automatic transmission
SELECT VIN FROM Auction_Automobile WHERE make = 'Toyota'
UNION
select VIN from auction_automobile where trans = 'auto';

# 9. Query using sort by (ORDER BY)
# Return names and addresses for all employees whose salary is greater than $90,000
select name, address
from employee
where salary > 90000
ORDER by name;

# 10. Query using all
# Return make and model of all vehicles if all titles are clean. 
select make, model
from auction_automobile
where title = all (select title 
from auction_automobile
where title = 'clean')



