INSERT INTO USERS VALUES (1, 'Wendy Atkins', '11 Westminster Close, Rodley, LS13 1PD', TO_DATE('10-01-2021', 'DD-MM-YYYY'), TO_DATE('15-04-1990', 'DD-MM-YYYY'), '079 4627 3276', 'wendy.atkins@icloud.com', 'ACTIVE', 'STUDENT');
INSERT INTO USERS VALUES (2, 'Russell Eckersley', '20 Long Meadow Walk, Carlton Colville, NR33 8LT', TO_DATE('20-05-2020', 'DD-MM-YYYY'), TO_DATE('22-08-1985', 'DD-MM-YYYY'), '078 2589 9654', 'russel.eckersley@gmail.com', 'ACTIVE', 'STAFF');
INSERT INTO USERS VALUES (3, 'Janet Jones', 'Long Barn House, Common Street, Ravenstone, MK46 5AS', TO_DATE('01-09-2021', 'DD-MM-YYYY'), TO_DATE('10-12-1992', 'DD-MM-YYYY'), '078 5087 0371', 'janetjones@outlook.com', 'ACTIVE', 'BOTH');
INSERT INTO USERS VALUES (4, 'James McCash', 'Waen Gelli Felin, Tylwch, SY18 6JS', TO_DATE('15-03-2019', 'DD-MM-YYYY'), TO_DATE('05-07-1980', 'DD-MM-YYYY'), '078 2771 6357', 'james.mccash@gmail.com', 'ACTIVE', 'STAFF');
INSERT INTO USERS VALUES (5, 'Julie Taylor', '9 Gisbey House, Union Lane, Isleworth, TW7 6GH', TO_DATE('08-02-2022', 'DD-MM-YYYY'), TO_DATE('20-11-2000', 'DD-MM-YYYY'), '079 2472 2768', 'julie.taylor@icloud.com', 'ACTIVE', 'STUDENT');


INSERT INTO STUDENTS VALUES (1, 2);
INSERT INTO STUDENTS VALUES (3, 1);
INSERT INTO STUDENTS VALUES (5, 1);


INSERT INTO STAFF VALUES (2, 2);
INSERT INTO STAFF VALUES (3, 1);
INSERT INTO STAFF VALUES (4, 1);



INSERT INTO RESOURCES VALUES (1, 'Introduction to Databases', '3rd', 'BOOKS', 100, 1, 1, 'STANDARD', 14);
INSERT INTO RESOURCES VALUES (2, 'Learning Python', '2nd', 'BOOKS', 200, 5, 2, 'IN_LIBRARY', 0);
INSERT INTO RESOURCES VALUES (3, 'Advanced SQL', '1st', 'BOOKS', 150, 2, 1, 'SHORT_TERM', 2);
INSERT INTO RESOURCES VALUES (4, 'The World of Science', '4th', 'DVD', 300, 7, 3, 'STANDARD', 14);
INSERT INTO RESOURCES VALUES (5, 'Mathematical Concepts', '3rd', 'CD', 250, 4, 2, 'STANDARD', 14);


INSERT INTO COPIES VALUES (1, 1, 'ON-LOAN');
INSERT INTO COPIES VALUES (2, 1, 'ON-LOAN');
INSERT INTO COPIES VALUES (3, 2, 'AVAILABLE');
INSERT INTO COPIES VALUES (4, 3, 'ON-LOAN');
INSERT INTO COPIES VALUES (5, 4, 'AVAILABLE');
INSERT INTO COPIES VALUES (6, 5, 'AVAILABLE');
INSERT INTO COPIES VALUES (7, 2, 'AVAILABLE');
INSERT INTO COPIES VALUES (8, 2, 'ON-LOAN');
INSERT INTO COPIES VALUES (9, 3, 'AVAILABLE');
INSERT INTO COPIES VALUES (10, 3, 'AVAILABLE');
INSERT INTO COPIES VALUES (11, 4, 'ON-LOAN');
INSERT INTO COPIES VALUES (12, 5, 'AVAILABLE');


INSERT INTO LOANS VALUES (11, 3, 6, TO_DATE('20-10-2023', 'DD-MM-YYYY'), TO_DATE('03-11-2023', 'DD-MM-YYYY'), NULL, 'ACTIVE');
INSERT INTO LOANS VALUES (12, 3, 1, TO_DATE('10-11-2023', 'DD-MM-YYYY'), TO_DATE('24-11-2023', 'DD-MM-YYYY'), NULL, 'ACTIVE');
INSERT INTO LOANS VALUES (13, 5, 7, TO_DATE('11-11-2023', 'DD-MM-YYYY'), TO_DATE('25-11-2023', 'DD-MM-YYYY'), NULL, 'ACTIVE');
INSERT INTO LOANS VALUES (14, 1, 9, TO_DATE('12-11-2023', 'DD-MM-YYYY'), TO_DATE('26-11-2023', 'DD-MM-YYYY'), NULL, 'ACTIVE');
INSERT INTO LOANS VALUES (15, 4, 8, TO_DATE('18-11-2023', 'DD-MM-YYYY'), TO_DATE('02-12-2023', 'DD-MM-YYYY'), NULL, 'ACTIVE');
INSERT INTO LOANS VALUES (16, 2, 11, TO_DATE('16-11-2023', 'DD-MM-YYYY'), TO_DATE('01-12-2023', 'DD-MM-YYYY'), NULL, 'ACTIVE');


INSERT INTO FINES VALUES (1, 11, 10.00, TO_DATE('04-11-2023', 'DD-MM-YYYY'), TO_DATE('14-11-2023', 'DD-MM-YYYY'), NULL, 'UNPAID');
INSERT INTO FINES VALUES (2, 12, 0.00, TO_DATE('25-11-2023', 'DD-MM-YYYY'), NULL, NULL, 'UNPAID');


INSERT INTO RESERVATION VALUES (1, 5, 7, TO_DATE('10-11-2023', 'DD-MM-YYYY'), TO_DATE('12-11-2023', 'DD-MM-YYYY'), TO_DATE('14-11-2023', 'DD-MM-YYYY'), 'Accepted', 1);
INSERT INTO RESERVATION VALUES (2, 1, 9, TO_DATE('11-11-2023', 'DD-MM-YYYY'), TO_DATE('11-11-2023', 'DD-MM-YYYY'), TO_DATE('13-11-2023', 'DD-MM-YYYY'), 'Accepted', 1);
INSERT INTO RESERVATION VALUES (3, 4, 8, TO_DATE('13-11-2023', 'DD-MM-YYYY'), TO_DATE('15-11-2023', 'DD-MM-YYYY'), TO_DATE('17-11-2023', 'DD-MM-YYYY'), 'Declined', 3);
INSERT INTO RESERVATION VALUES (4, 2, 11, TO_DATE('14-11-2023', 'DD-MM-YYYY'), TO_DATE('16-11-2023', 'DD-MM-YYYY'), TO_DATE('18-11-2023', 'DD-MM-YYYY'), 'Accepted', 1);


INSERT INTO LOANHISTORY VALUES (1, 1, 1, 1, 1, TO_DATE('01-01-2023', 'DD-MM-YYYY'), TO_DATE('14-01-2023', 'DD-MM-YYYY'), TO_DATE('14-01-2023', 'DD-MM-YYYY'), 'NO');
INSERT INTO LOANHISTORY VALUES (2, 2, 2, 2, 3, TO_DATE('15-01-2023', 'DD-MM-YYYY'), TO_DATE('15-01-2023', 'DD-MM-YYYY'), TO_DATE('15-01-2023', 'DD-MM-YYYY'), 'NO');
INSERT INTO LOANHISTORY VALUES (3, 3, 3, 1, 2, TO_DATE('01-02-2023', 'DD-MM-YYYY'), TO_DATE('14-02-2023', 'DD-MM-YYYY'), TO_DATE('16-02-2023', 'DD-MM-YYYY'), 'YES');
INSERT INTO LOANHISTORY VALUES (4, 4, 4, 4, 5, TO_DATE('17-02-2023', 'DD-MM-YYYY'), TO_DATE('03-03-2023', 'DD-MM-YYYY'), TO_DATE('07-03-2023', 'DD-MM-YYYY'), 'YES');
INSERT INTO LOANHISTORY VALUES (5, 5, 5, 5, 6, TO_DATE('06-03-2023', 'DD-MM-YYYY'), TO_DATE('20-03-2023', 'DD-MM-YYYY'), TO_DATE('20-03-2023', 'DD-MM-YYYY'), 'NO');
INSERT INTO LOANHISTORY VALUES (6, 6, 1, 1, 2, TO_DATE('21-03-2023', 'DD-MM-YYYY'), TO_DATE('04-04-2023', 'DD-MM-YYYY'), TO_DATE('05-04-2023', 'DD-MM-YYYY'), 'YES');
INSERT INTO LOANHISTORY VALUES (7, 7, 2, 2, 3, TO_DATE('06-04-2023', 'DD-MM-YYYY'), TO_DATE('06-04-2023', 'DD-MM-YYYY'), TO_DATE('06-04-2023', 'DD-MM-YYYY'), 'NO');
INSERT INTO LOANHISTORY VALUES (8, 8, 3, 3, 4, TO_DATE('23-04-2023', 'DD-MM-YYYY'), TO_DATE('25-04-2023', 'DD-MM-YYYY'), TO_DATE('12-05-2023', 'DD-MM-YYYY'), 'YES');
INSERT INTO LOANHISTORY VALUES (9, 9, 4, 5, 12, TO_DATE('09-05-2023', 'DD-MM-YYYY'), TO_DATE('23-05-2023', 'DD-MM-YYYY'), TO_DATE('24-05-2023', 'DD-MM-YYYY'), 'YES');
INSERT INTO LOANHISTORY VALUES (10, 10, 5, 3, 10, TO_DATE('25-05-2023', 'DD-MM-YYYY'), TO_DATE('25-05-2023', 'DD-MM-YYYY'), TO_DATE('25-05-2023', 'DD-MM-YYYY'), 'NO');
