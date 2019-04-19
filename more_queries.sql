/* 
1. not in
 Return the Name of all employees who are not Auctioneers.
*/

select name
from Employee
where ssn not in (select assn
                  from Auctioneer)



/*
2. exists
 Return the lot number of lots with ownerless cars
*/

select lot_number
from Location
where exists (select *
              from Auction_Automobile
              where owner is Null);


/*
3. not exists
 Return the vin, make, model, and year of cars with more than 245,000 miles
*/

select vin, make, model, year
from Auction_Automobile as aa1
where not exists (select *
                  from Auction_Automobile as aa2
                  where aa1.vin = aa2.vin and mileage < 245000);