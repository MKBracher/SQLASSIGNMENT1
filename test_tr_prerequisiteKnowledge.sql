

--insert some extra data
INSERT INTO courseOffering VALUES
('CO000006', 'BIOL1001', 'S0000002', 'TERM0004', 'CAMP0002'),
('CO000007', 'BIOL2001', 'S0000002', 'TERM0004', 'CAMP0003'),
('CO000008', 'MATH1002', 'S0000001', 'TERM0002', 'CAMP0001'),
('CO000009', 'COMP1140', 'S0000003', 'TERM0003', 'CAMP0002'),
('CO000010', 'COMP3350', 'S0000002', 'TERM0003', 'CAMP0002')


--success
INSERT INTO enrolledIn VALUES 
('C0000003', 'CO000006', '51', 'Completed')
--Fail
INSERT INTO enrolledIn VALUES 
('C0000002', 'CO000007', '33', 'Completed')
--Success
INSERT INTO enrolledIn VALUES 
('C0000003', 'CO000008', '86', 'Completed')
--Success
INSERT INTO enrolledIn VALUES 
('C0000003', 'CO000010', NULL , 'Enrolled')
--Failed
INSERT INTO enrolledIn VALUES
('C0000001', 'CO000001', '75', 'Completed')
--Failed
INSERT INTO enrolledIn VALUES
('C0000001', 'CO000002', '68', 'Completed')
--Failed
INSERT INTO enrolledIn VALUES
('C0000002', 'CO000003', '88', 'Completed')
--Failed
INSERT INTO enrolledIn VALUES
('C0000003', 'CO000005', '77', 'Enrolled')




select * from enrolledIn






INSERT INTO enrolledIn VALUES
('C0000001', 'CO000001', '75', 'Completed')
('C0000001', 'CO000002', '68', 'Completed'),
('C0000002', 'CO000003', '88', 'Completed'),
('C0000003', 'CO000005', '77', 'Enrolled');


select * from enrolledIn
