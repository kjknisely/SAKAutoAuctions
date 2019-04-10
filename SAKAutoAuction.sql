create table AuctionAuto (
	vin char(17) primary key,
	color varchar(10),
	make varchar(16),
	model varchar(16),
	owner varchar(32),
	year int,
	title char,
	trans char,
	foreign key (lot_num) references location (lot_number),
	reserve int,
	mileage int,
);

create table Location (
	num_cars_in_lot int,
	rent int,
	lot_size int,
	l_address varchar(100),
	lot_number int primary key,
);

create table Employee (
	ssn int primary key,
	name varchar(30),
	address varchar(100),
	salary int,
	foreign key (e_lot_num) references location (lot_number),
);

create table Auctioneer (
	foreign key (assn) references Employee (ssn),
	sales_rate int,
);

create table BidRep(
	foreign key (bssn) references Employee (ssn),
	numsales int,
);

create table Driver (
	foreign key (bssn) references Employee (ssn),
	License_num char(8),
);
