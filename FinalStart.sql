DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE service CASCADE CONSTRAINTS;
DROP TABLE plant_type CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE sale CASCADE CONSTRAINTS;


CREATE TABLE category
(cat_id NUMBER (3) PRIMARY KEY,
cat_name VARCHAR2 (25),
type CHAR (1) CHECK (type = 'S' or type = 'T' or type = 'O'));
--'S' is shrub; 'T' is tree; 'O' is other

CREATE TABLE service
(service_id NUMBER (4) PRIMARY KEY,
service_name VARCHAR2 (25),
labor_cost NUMBER (6, 2));

CREATE TABLE plant_type
(plant_id NUMBER (5) PRIMARY KEY,
plant_name VARCHAR2 (35),
qty_in_stock NUMBER (4),
category NUMBER (3) REFERENCES category (cat_id) NOT NULL);

CREATE TABLE employee
(emp_id NUMBER (3) PRIMARY KEY,
l_name VARCHAR2 (35),
date_hired DATE NOT NULL,
service_length INTERVAL YEAR TO MONTH,
service NUMBER (4) NOT NULL REFERENCES service (service_id));

CREATE TABLE sale
(sale_id NUMBER (5) PRIMARY KEY,
sale_date DATE,
sale_qty NUMBER (3),
sale_amt NUMBER (10, 2),
plant NUMBER (5) NOT NULL REFERENCES plant_type (plant_id),
employee NUMBER (3) NOT NULL REFERENCES employee (emp_id));

INSERT INTO category
VALUES (101, 'Hardwood Trees', 'T');

INSERT INTO category
VALUES (102, 'Evergreens', 'T');

INSERT INTO category
VALUES (103, 'Fruit Trees', 'T');

INSERT INTO category
VALUES (104, 'Hedges', 'S');

INSERT INTO category
VALUES (105, 'Grasses', 'O');

INSERT INTO category
VALUES (106, 'Flowering Shrubs', 'S');

INSERT INTO service
VALUES (500, 'Tree Planting', 12.50);

INSERT INTO service
VALUES (501, 'Hedge Planting', 14.75);

INSERT INTO service
VALUES (502, 'Exterior Design', 24.50);

INSERT INTO service
VALUES (503, 'Tree Removal', 13.00);

INSERT INTO service
VALUES (504, 'Stump Removal', 8.50);

INSERT INTO service
VALUES (505, 'Shrub Trimming', 11.40);

INSERT INTO service
VALUES (506, 'Yard Work', 9.00);

INSERT INTO employee
VALUES (1, 'Mason', TO_DATE ('5/99', 'MM/YY'), TO_YMINTERVAL ('20-2'), 502);

INSERT INTO employee
VALUES (2, 'Munoz', TO_DATE ('8/13', 'MM/YY'), TO_YMINTERVAL ('6-1'), 501);

INSERT INTO employee
VALUES (3, 'Espera', TO_DATE ('4/16', 'MM/YY'), TO_YMINTERVAL ('3-10'), 503);

INSERT INTO employee
VALUES (4, 'Manuel', TO_DATE ('3/14', 'MM/YY'), TO_YMINTERVAL ('5-11'), 505);

INSERT INTO employee
VALUES (5, 'Robert', TO_DATE ('7/18', 'MM/YY'), TO_YMINTERVAL ('1-5'), 506);

INSERT INTO employee
VALUES (6, 'Casper', TO_DATE ('6/10', 'MM/YY'), TO_YMINTERVAL ('9-7'), 504);

INSERT INTO employee
VALUES (7, 'Emmanual', TO_DATE ('8/19', 'MM/YY'), TO_YMINTERVAL ('0-11'), 504);

INSERT INTO plant_type
VALUES (2000, 'Juniper', 42, 102);

INSERT INTO plant_type
VALUES (2001, 'Elm', 18, 101);

INSERT INTO plant_type
VALUES (2002, 'Hyacinth', 140, 104);

INSERT INTO plant_type
VALUES (2003, 'Leyland Cypress', 22, 102);

INSERT INTO plant_type
VALUES (2004, 'Beech', 8, 101);

INSERT INTO plant_type
VALUES (2005, 'Zoysia', 24, 105);

INSERT INTO plant_type
VALUES (2006, 'Azalia', 85, 104);

INSERT INTO plant_type
VALUES (2007, 'Japanese Maple', 20, 106);

INSERT INTO plant_type
VALUES (2008, 'Silver Maple', 15, 101);

INSERT INTO plant_type
VALUES (2009, 'Azalea', 32, 106);

INSERT INTO sale
VALUES (1000, TO_DATE ('Mar 22, 2023', 'Mon DD, YYYY'), 3, 142.5, 2004, 3);

INSERT INTO sale
VALUES (1001, TO_DATE ('Mar 30, 2022', 'Mon DD, YYYY'), 1, 76, 2001, 1);

INSERT INTO sale
VALUES (1002, TO_DATE ('Mar 31, 2023', 'Mon DD, YYYY'), 15, 845.25, 2003, 4);

INSERT INTO sale
VALUES (1003, TO_DATE ('Apr 19, 2022', 'Mon DD, YYYY'), 2, 111.75, 2000, 1);

INSERT INTO sale
VALUES (1004, TO_DATE ('Apr 28, 2024', 'Mon DD, YYYY'), 6, 278.25, 2004, 2);

INSERT INTO sale
VALUES (1005, TO_DATE ('Apr 28, 2023', 'Mon DD, YYYY'), 4, 186.11, 2007, 2);

INSERT INTO sale
VALUES (1006, TO_DATE ('Apr 28, 2022', 'Mon DD, YYYY'), 85, 335.35, 2005, 2);

INSERT INTO sale
VALUES (1007, TO_DATE ('Apr 28, 2022', 'Mon DD, YYYY'), 5, 450, 2008, 2);

INSERT INTO sale
VALUES (1008, TO_DATE ('Apr 28, 2023', 'Mon DD, YYYY'), 4, 210.01, 2003, 2);