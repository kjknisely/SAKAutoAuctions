/*update correct number of cars in lot*/



/*insert single tuple*/

insert into Auction_Automobile values ('1d7FC7ZAtemporary', 'Silver', 'Dodge', 'Dakota', 'keegan', 2005, 'clean', 'auto', 4, null, 131007);

/*show table with 911s, then delete one, show change, reinsert(for consistancy)*/

select * from Auction_Automobile where model = '911';
delete from Auction_Automobile where vin = 'SCBFC7ZA6EC752199';
select * from Auction_Automobile where model = '911';

insert into Auction_Automobile values ('SCBFC7ZA6EC752199', 'Purple', 'Porsche', '911', 'dealer', 1996, 'junk', 'manual', 4, null,189007);

/*temp tuples to do multi delete*/
insert into Auction_Automobile values ('5N1AA0NDtemporary', 'Black', 'Honda', 'Inspire', 'keegan', 1993, 'clean', 'auto', 1, null, 93379);
insert into Auction_Automobile values ('5N1AA486temporary', 'White', 'Chevrolet', 'G-Series G20', 'keegan', 1993, 'clean', 'auto', 1, null, 121379);


/*delete multi tuple (my temp cars)*/
select * from Auction_Automobile where owner = 'keegan';
delete from Auction_Automobile where vin in (
	select vin from (select * from Auction_Automobile) as d
	where d.owner = 'keegan');
select * from Auction_Automobile where owner = 'keegan';

/*updates all priuses with new owner*/
select * from Auction_Automobile where model = 'Prius';
update Auction_Automobile set owner = '***DEVIL***' where vin = '5N1AA0ND1FN712067';

select * from Auction_Automobile where model = 'Prius';
/*update multiple*/
update Auction_Automobile  set owner = '***SatanOwnsAPrius***' where vin in (
	select vin from (select * from Auction_Automobile) as u where u.model = 'Prius');

select * from Auction_Automobile where model = 'Prius';

/*reset owners to original*/
update Auction_Automobile  set owner = null where vin in (
	select vin from (select * from Auction_Automobile) as u where u.model = 'Prius');

