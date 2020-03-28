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