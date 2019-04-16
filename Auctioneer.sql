create table Auctioneer (
	assn int,
	salesrate int,
	foreign key (assn) references employee (ssn)
);

insert into Auctioneer (assn, salesrate) values (737635511, 42);
insert into Auctioneer (assn, salesrate) values (407895301, 35);

insert into Auctioneer (assn, salesrate) values (628761508, 45);
insert into Auctioneer (assn, salesrate) values (339659428, 33);

insert into Auctioneer (assn, salesrate) values (718906354, 39);
insert into Auctioneer (assn, salesrate) values (588300301, 37);

insert into Auctioneer (assn, salesrate) values (96606700, 46);

insert into Auctioneer (assn, salesrate) values (8795377, 35);
insert into Auctioneer (assn, salesrate) values (984159086, 34);
insert into Auctioneer (assn, salesrate) values (845254654, 23);

