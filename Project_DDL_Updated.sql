CREATE TABLE IF NOT EXISTS Branch(
	BID char(3),
    street varchar(20),
    city varchar(12),
    state char(2),
    zip_code char(5),
	PRIMARY KEY(BID)
);

Create Table if not exists Employee(
    street varchar(20),
    city varchar(12),
    state char(2),
    zip_code char(5),
    salary numeric(12, 2),
    SSN numeric(9) NOT null,
    name varchar(20) NOT null,
    primary key(SSN)
    );

Create Table if not exists Account_Type(
    fee numeric(12, 2),
    interest numeric(6,0),
    minBalance numeric(12, 2),
    accType text,
    primary key(acctype)
);

Create Table if not exists Account(
    accID char(20),
    balance numeric(12, 2),
	hasType text NOT NULL,
    primary key(accID),
	FOREIGN KEY(hasType)
        REFERENCES Account_Type(accType)
        ON DELETE CASCADE
		ON UPDATE CASCADE
    );
	
Create Table if not exists Transactions(
    description text,
    amount numeric(12, 2),
    t_type text,
    tID char(12),
	performedBy char(20) NOT NULL,
    date date,
    Primary key(tID),
	FOREIGN KEY(performedBy)
        REFERENCES Account(accID)
        ON DELETE CASCADE
		ON UPDATE CASCADE
    );

Create Table if not exists Customer(
    name varchar(20),
    CID char(10),
    street varchar(20),
    city varchar(12),
    state char(2),
    zip_code char(5),
    homeBranch char(3) NOT NULL,
    primary key(CID),
    FOREIGN KEY(homeBranch)
        REFERENCES Branch(BID)
        ON DELETE CASCADE
	ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS Owns(
	account char(20),
	ownedBy char(10),
	FOREIGN KEY(account) 
		REFERENCES Account(accID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(ownedBy)
		REFERENCES Customer(CID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(account, ownedBy)
);

CREATE TABLE IF NOT EXISTS Teller(
	SSN numeric(9) PRIMARY KEY REFERENCES Employee
								ON DELETE CASCADE, --can't really update a SSN only delete when employee leaves
	worksAtBID varchar(3) NOT NULL,
	tellerPermission bool NOT NULL,
	FOREIGN KEY(worksAtBID)
        REFERENCES Branch(BID)
        ON DELETE CASCADE
		ON UPDATE CASCADE
	);

CREATE TABLE IF NOT EXISTS Manager(
	SSN numeric(9) PRIMARY KEY REFERENCES Employee
								ON DELETE CASCADE, --can't really update a SSN only delete when employee leaves
	manages char(3) NOT NULL,
	managerPermission bool NOT NULL,
	FOREIGN KEY(manages)
        REFERENCES Branch(BID)
        ON DELETE CASCADE
		ON UPDATE CASCADE
	);

CREATE TABLE IF NOT EXISTS LoanSpecialist(
	SSN numeric(9) PRIMARY KEY REFERENCES Employee
								ON DELETE CASCADE, --can't really update a SSN only delete when employee leaves
	worksAt char(3) NOT NULL,
	loanPermission bool NOT NULL,
	FOREIGN KEY(worksAt)
        REFERENCES Branch(BID)
        ON DELETE CASCADE
		ON UPDATE CASCADE
	);
	
Create Table if not exists Loan(
    amount numeric(12,2),
    runtime int,
    loanID char(12),
    schedule text,
	managedBy numeric(9) NOT NULL,
	loanedBy char(10),
    primary key(loanID),
	FOREIGN KEY(managedBy)
        REFERENCES LoanSpecialist(SSN)
        ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(loanedBy)
        REFERENCES Customer(CID)
        ON DELETE CASCADE
		ON UPDATE CASCADE
);
