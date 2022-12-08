INSERT INTO branch VALUES
    ('001', '3201 S State St', 'Chicago', 'IL', '60616'),
    ('002', '200 Park Ave', 'New York', 'NY', '10166'),
    ('003', '888 S Figueroa St', 'Los Angles', 'CA', '90001'),
    ('004', '1601 S Orange Ave', 'Orlando', 'FL', '32789'),
    ('005', '401 Union St', 'Seattle', 'WA', '98101'),
    ('006', '1550 W 18th St', 'Houston', 'TX', '77001')
;

INSERT INTO employee VALUES
    ('3534 S State St', 'Chicago', 'IL', '60616', 75000, '123456789', 'James Doe'),
    ('3555 S State St', 'Chicago', 'IL', '60616', 75000, '444444444', 'James Doe Jr'),
    ('210 Park Ave', 'New York', 'NY', '10166', 120000, '987654321', 'John Doe'),
    ('777 S Figueroa St', 'Los Angles', 'CA', '90001', 85000, '543216789', 'Jane Doe'),
    ('1590 S Orange Ave', 'Orlando', 'FL', '32789', 77000, '111111111', 'Orlando Jones'),
    ('420 Union St', 'Seattle', 'WA', '98101', 100000, '222222222', 'John Union'),
    ('1500 W 18th St', 'Houston', 'TX', '77001', 90000, '333333333', 'Timmy Jones')
;

INSERT INTO manager VALUES 
    ('123456789', '001', true),
    ('987654321', '002', true),
    ('543216789', '003', true),
    ('111111111', '004', true),
    ('222222222', '005', true),
    ('333333333', '006', true)
;

INSERT INTO teller VALUES
    ('444444444', '001', true)
;

INSERT INTO account_type values
    (25, 1, 50, 'Checking'),
    (100, 6, 200, 'Savings')
;