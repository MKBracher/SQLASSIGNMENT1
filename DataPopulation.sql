INSERT INTO enrollment VALUES
('E0000001', '2011-01-21', '2016-11-14', 'Graduated', 'P0000001'),
('E0000002', '2017-02-01', NULL, 'Studying', 'P0000001'), 
('E0000003', '2019-07-15', NULL, 'Differed', 'P0000002');

INSERT INTO programme VALUES
('P0000001', 'Bachelor of Science', 240, 'BSc', 'O0000002', 'M0000001'), 
('P0000002', 'Bachelor of Engineering', 240, 'BSc', 'O0000001', 'M0000003'), 
('P0000003', 'Bachelor of Law', 240, 'BSc', 'O0000003', 'M0000002');

INSERT INTO certification VALUES
('BSc', 'Bachelor of Science'),
('M.A', 'Master’s'),
('PhD', 'Doctor of Philosophy');

INSERT INTO orgUnit VALUES
('O0000001', 'Faculty of Engineering', 'Engineering and Built Environments', '43328977'),
('O0000002', 'Faculty of Science', 'Science and Environmental Studies', '43328651'),
('O0000003', 'Faculty of Law', 'Legal Studies and Practices', '433297834');

INSERT INTO majorMinor VALUES
('M0000001', 'Biology', 'major', 120, NULL),
('M0000002', 'Psychology', 'minor', 40, NULL),
('M0000003', 'Software', 'major', 120, '12 weeks work experience');


INSERT INTO staff VALUES
(“S0000001”, “academic”, “Susan”,  “Boyle”, “254 Pumpkin lane”, “0477899877”),
(“S0000002”, “academic”, “Leroy”, “Jenkins”, “189 Caspien Drive”, “0467575414”),
(“S0000003”, “admin”, “James”, “Leon”, “89 Twether Avenue”, “0487828662”);


INSERT INTO subUnit VALUES(O0000002, U0000001, Biology),
(“O0000001”, “U0000002”, “Software”),
(“O0000001”, “U0000003”, “Electrical”);


INSERT INTO contain VALUES
(“S0000001”, “O0000003”, “2017-03-24”, “NULL”, “lecturer”),
(“S0000002”, “O0000002”, “2004-07-15”, “2019-11-17”, “lecturer”),
(“S0000003”, “O0000001”, “2015-07-01”, “NULL”, “tutor”);


INSERT INTO student VALUES
(“C0000001”, “James”, “Wire”, “76 Dire Street”, “0413726559”, “E0000001”),
(“C0000002”, “Sarah”, “Moore”, “1/107 Honer Boulevard”, “0439917682”, “E0000002”),
(“C0000003”, “Amy”, “Patrick”, “4 Scarlett Street”, “0411139265”, “E0000003”);

INSERT INTO course VALUES
(“BIOL2001”, “Advanced Biology”, “10”, “A practical approach to advanced biological research skills”),
(“MATH1110”, “Mathematics”, “10”, “Advanced Mathematical functions”),
(“COMP3350”, “Advanced Database Design”, “10”, “A practical approach to the design and implementation of databases”);


INSERT INTO assumedKnowledge VALUES
(“BIOL2001”, “BIOL1001”),
(“COMP3350”, “COMP1050”),
(“MATH1110”, “MATH1002”);


INSERT INTO campus VALUES
(“CAMP0001”, “Online”),
(“CAMP0002”, “Callaghan”),
(“CAMP0003”, “Ourimbah”),
(“CAMP0004”, “Sydney”),
(“CAMP0005”, “Singapore”);

INSERT INTO physicalCampus VALUES
(“CAMP0002”, “Callaghan”, “Australia”),
(“CAMP0003”, “Ourimbah”, “Australia”),
(“CAMP0004”, “Sydney”, “Australia”),
(“CAMP0005”, “Singapore”, “Singapore”);


INSERT INTO term VALUES
(“TERM0001”, “1”, “2017”),
(“TERM0002”, “2”, “2017”),
(“TERM0003”, “1”, “2018”),
(“TERM0004”, “2”, “2018”);



INSERT INTO courseOfferingVALUES
(‘CO000001’, ‘BIOL2001’, ‘S0000002’, ‘TERM0004’, ‘CAMP0002’),
(‘CO000002’, ‘BIOL2001’, ‘S0000002’, ‘TERM0004’, ‘CAMP0003’),
(‘CO000003’, ‘MATH1110’, ‘S0000001’, ‘TERM0002’, ‘CAMP0001’),
(‘CO000004’, ‘COMP3350’, S0000003’, ‘TERM0003’, ‘CAMP0002’);



INSERT INTO facility VALUES
(‘F0000001’, ‘12’, ‘Classroom North’, ‘30’, ‘Classroom’, ‘CAMP0003’),
(‘F0000002’, ‘1’, ‘Classroom Right’, ‘60’, ‘Classroom’, ‘CAMP0002’),
(‘F0000003’, ‘3’, ‘Lecture Hall 3’, ‘600’, ‘Lecture Hall’, ‘CAMP0002’);


INSERT INTO possesses VALUES
(‘F0000001’, ‘CO000001’, ‘08:00:00’, ‘2018-07-15’),
(‘F0000001’, ‘CO000001’, ‘10:00:00’, ‘2018-07-15’),
(‘F0000003’, ‘CO000004’, ‘12:00:00’, ‘2018-03-15’);


INSERT INTO has VALUES
(‘BIOL2001’,’P0000001’, ‘CORE’),
(‘MATH1110’, ‘P0000002’, ‘CORE’),
(‘COMP3350’, ‘P0000002’, ‘DIRECTED’);















