--Step 1
CREATE TABLE EMPLOYEE (
    fname VARCHAR(15),
    minit CHAR,
    lname VARCHAR(15),
    ssn CHAR(9) PRIMARY KEY,
    bdate DATE,
    address VARCHAR(50),
    sex CHAR,
    salary NUMERIC(10,2),
    superssn CHAR(9) REFERENCES EMPLOYEE(ssn),
    dno INTEGER
);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  ('James','E','Borg','888665555','1927-11-10','450 Stone, Houston, TX','M',55000,null,null);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES ('Franklin','T','Wong','333445555','1945-12-08','638 Voss, Houston, TX','M',40000,'888665555',null);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES ('Jennifer','S','Wallace','987654321','1931-06-20','291 Berry, Bellaire, TX','F',43000,'888665555',null);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES ('Jared','D','James','111111100','1966-10-10','123 Peachtree, Atlanta, GA','M',85000,null,null);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES ('Alex','D','Freed','444444400','1950-10-09','4333 Pillsbury, Milwaukee, WI','M',89000,null,null);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES ('John','C','James','555555500','1975-06-30','7676 Bloomington, Sacramento, CA','M',81000,null,null);



--Step 2
CREATE TABLE DEPARTMENT (
    dname VARCHAR(15),
    dnumber INTEGER PRIMARY KEY,
    mgrssn CHAR(9),
    mgrstartdate DATE
);

INSERT INTO DEPARTMENT (dname, dnumber, mgrssn, mgrstartdate) VALUES 
('Research', 5, '333445555', '1978-05-22'),
('Administration', 4, '987654321', '1985-01-01'),
('Headquarters', 1, '888665555', '1971-06-19'),
('Software', 6, '111111100', '1999-05-15'),
('Hardware', 7, '444444400', '1998-05-15'),
('Sales', 8, '555555500', '1997-01-01');


--Step 3
UPDATE EMPLOYEE SET dno = 5 WHERE ssn = '333445555';
UPDATE EMPLOYEE SET dno = 4 WHERE ssn = '987654321';
UPDATE EMPLOYEE SET dno = 1 WHERE ssn = '888665555';
UPDATE EMPLOYEE SET dno = 6 WHERE ssn = '111111100';
UPDATE EMPLOYEE SET dno = 7 WHERE ssn = '444444400';
UPDATE EMPLOYEE SET dno = 6 WHERE ssn = '555555500';


--Step 4
INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (John,B,Smith,123456789,09-Jan-1955,'731 Fondren, Houston', TX,M,30000,333445555,5);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Alicia,J,Zelaya,999887777,19-JUL-1958,'3321 Castle, Spring, TX',F,25000,987654321,4);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Ramesh,K,Narayan,666884444,15-SEP-1952,'971 Fire Oak, Humble, TX',M,38000,333445555,5);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Joyce,A,English,453453453,31-JUL-1962,'5631 Rice Oak, Houston, TX',F,25000,333445555,5);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Ahmad,V,Jabbar,987987987,29-MAR-1959,'980 Dallas, Houston, TX',M,25000,987654321,4);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Jon,C,Jones,111111101,14-NOV-1967,'111 Allgood, Atlanta, GA',M,45000,111111100,6);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Justin,null,Mark,111111102,12-JAN-1966,'2342 May, Atlanta, GA',M,40000,111111100,6);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Brad,C,Knight,111111103,13-FEB-1968,'176 Main St., Atlanta, GA',M,44000,111111100,6);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Evan,E,Wallis,222222200,16-JAN-1958,'134 Pelham, Milwaukee, WI',M,92000,null,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Josh,U,Zell,222222201,22-MAY-1954,'266 McGrady, Milwaukee, WI',M,56000,222222200,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Andy,C,Vile,222222202,21-JUN-1944,'1967 Jordan, Milwaukee, WI',M,53000,222222200,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Tom,G,Brand,222222203,16-DEC-1966,'112 Third St, Milwaukee, WI',M,62500,222222200,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Jenny,F,Vos,222222204,11-NOV-1967,'263 Mayberry, Milwaukee, WI',F,61000,222222201,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Chris,A,Carter,222222205,21-MAR-1960,'565 Jordan, Milwaukee, WI',F,43000,222222201,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Kim,C,Grace,333333300,23-OCT-1970,'6677 Mills Ave, Sacramento, CA',F,79000,null,6);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Jeff,H,Chase,333333301,07-JAN-1970,'145 Bradbury, Sacramento, CA',M,44000,333333300,6);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Bonnie,S,Bays,444444401,19-JUN-1956,'111 Hollow, Milwaukee, WI',F,70000,444444400,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Alec,C,Best,444444402,18-JUN-1966,'233 Solid, Milwaukee, WI',M,60000,444444400,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Sam,S,Snedden,444444403,31-JUL-1977,'987 Windy St, Milwaukee, WI',M,48000,444444400,7);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Nandita,K,Ball,555555501,16-APR-1969,'222 Howard, Sacramento, CA',M,62000,555555500,6);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Bob,B,Bender,666666600,17-APR-1968,'8794 Garfield, Chicago, IL',M,96000,null,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Jill,J,Jarvis,666666601,14-JAN-1966,'6234 Lincoln, Chicago, IL',F,36000,666666600,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Kate,W,King,666666602,16-APR-1966,'1976 Boone Trace, Chicago, IL',F,44000,666666600,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Lyle,G,Leslie,666666603,09-JUN-1963,'417 Hancock Ave, Chicago, IL',M,41000,666666601,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Billie,J,King,666666604,01-JAN-1960,'556 Washington, Chicago, IL',F,38000,666666603,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Jon,A,Kramer,666666605,22-AUG-1964,'1988 Windy Creek, Seattle, WA',M,41500,666666603,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Ray,H,King,666666606,16-AUG-1949,'213 Delk Road, Seattle, WA',M,44500,666666604,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Gerald,D,Small,666666607,15-MAY-1962,'122 Ball Street, Dallas, TX',M,29000,666666602,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Arnold,A,Head,666666608,19-MAY-1967,'233 Spring St, Dallas, TX',M,33000,666666602,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Helga,C,Pataki,666666609,11-MAR-1969,'101 Holyoke St, Dallas, TX',F,32000,666666602,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Naveen,B,Drew,666666610,23-MAY-1970,'198 Elm St, Philadelphia, PA',M,34000,666666607,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Carl,E,Reedy,666666611,21-JUN-1977,'213 Ball St, Philadelphia, PA',M,32000,666666610,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Sammy,G,Hall,666666612,11-JAN-1970,'433 Main Street, Miami, FL',M,37000,666666611,8);

INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno) 
VALUES  (Red,A,Bacher,666666613,21-MAY-1980,'196 Elm Street, Miami, FL',M,33500,666666612,8);


--Step 5
CREATE TABLE PROJECT (
  pname VARCHAR(50),
  pnumber INT,
  plocation VARCHAR(50),
  dnum INT,
  PRIMARY KEY (pnumber)
);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('ProductX', 1, 'Bellaire', 5);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('ProductY', 2, 'Sugarland', 5);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('ProductZ', 3, 'Houston', 5);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('Computerization', 10, 'Stafford', 4);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('Reorganization', 20, 'Houston', 1);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('Newbenefits', 30, 'Stafford', 4);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('OperatingSystems', 61, 'Jacksonville', 6);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('DatabaseSystems', 62, 'Birmingham', 6);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('Middleware', 63, 'Jackson', 6);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('InkjetPrinters', 91, 'Phoenix', 7);

INSERT INTO PROJECT (pname, pnumber, plocation, dnum) 
VALUES ('LaserPrinters', 92, 'LasVegas', 7);


--Step 6
CREATE TABLE DEPT_LOCATIONS (
  dnumber INT NOT NULL,
  dlocation VARCHAR(30) NOT NULL,
  PRIMARY KEY (dnumber, dlocation)
);

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES (1, 'Houston');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (4, 'Stafford');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (5, 'Bellaire');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (5, 'Sugarland');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (5, 'Houston');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (6, 'Atlanta');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES (6, 'Sacramento');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (7, 'Milwaukee');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (8, 'Chicago');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (8, 'Dallas');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (8, 'Philadephia');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (8, 'Seattle');

INSERT INTO DEPT_LOCATIONS (dnumber, dlocation) 
VALUES  (8, 'Miami');
  
  
 --Step 7
CREATE TABLE DEPENDENT (
  essn CHAR(9),
  dependent_name VARCHAR(20),
  sex CHAR(1),
  bdate DATE,
  relationship VARCHAR(20),
  PRIMARY KEY (essn, dependent_name),
  FOREIGN KEY (essn) REFERENCES EMPLOYEE(essn)
);


INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('333445555', 'Alice', 'F', '1976-04-05', 'Daughter');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('333445555', 'Theodore', 'M', '1973-10-25', 'Son');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('333445555', 'Joy', 'F', '1948-05-03', 'Spouse');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('987654321', 'Abner', 'M', '1932-02-29', 'Spouse');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('123456789', 'Michael', 'M', '1978-01-01', 'Son');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('123456789', 'Alice', 'F', '1978-12-31', 'Daughter');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('123456789', 'Elizabeth', 'F', '1957-05-05', 'Spouse');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('444444400', 'Johnny', 'M', '1997-04-04', 'Son');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('444444400', 'Tommy', 'M', '1999-06-07', 'Son');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('444444401', 'Chris', 'M', '1969-04-19', 'Spouse');

INSERT INTO DEPENDENT (essn, dependent_name, sex, bdate, relationship) 
VALUES ('444444402', 'Sam', 'M', '1964-02-14', 'Spouse');


--Step 8
CREATE TABLE WORKS_ON (
  essn CHAR(9)   NOT NULL,
  pno INTEGER   NOT NULL,
  hours DECIMAL(4,1),
  PRIMARY KEY (essn, pno),
  FOREIGN KEY (essn) REFERENCES EMPLOYEE (ssn),
  FOREIGN KEY (pno) REFERENCES PROJECT (pnumber)
);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('123456789', 1, 20.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('123456789', 2, 7.5);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('666884444', 3, 40.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('453453453', 1, 20.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('453453453', 2, 20.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('333445555', 2, 10.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('333445555', 3, 10.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('333445555', 10, 10.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('333445555', 20, 10.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('999887777', 30, 30.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('999887777', 10, 10.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('987987987', 10, 35.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('987987987', 30, 5.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('987654321', 30, 20.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('987654321', 20, 15.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('888665555', 20, null);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('111111100', 61, 40.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('111111101', 61, 40.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('111111102', 61, 40.0);

INSERT INTO WORKS_ON (essn, pno, hours) 
VALUES ('111111103', 61, 40.0);
