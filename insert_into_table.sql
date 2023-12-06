
INSERT INTO university.Institutions (name, abbreviation) 
VALUES
    (Computer Science, CS),
    (Computer Engineering, CE);


INSERT INTO university.Programs (name, code)
VALUES
    (Computer Science Engineering Program, CSEP);




INSERT INTO university.program_institutions (program_id, institution_id)
VALUES
(1, 1),
(1, 2);




INSERT INTO university.Branches (name, Recommended_cources_requirment_minimum, program_id)
VALUES
(Computer Linguistics, 1, 1),
(Algorithms, 2, 1),
(Computer Software technology, 3, 1);



INSERT INTO university.program_branches (program_id, branch_name)
VALUES
(1, Computer Linguistics),
(1, Algorithms),
(1, Computer Software technology);



INSERT INTO university.Courses (code, name, institution_id, credits, classification_ids, grade_ceiling)
VALUES
  ('CS101', 'Introduction to Computer Science', 1, 3, ARRAY[1, 2], 4),
  ('CS102', 'Data Structures', 1, 3, ARRAY[1, 2], 4),
  ('CS103', 'Computer Architecture', 1, 3, ARRAY[1, 2], 4),
  ('CS104', 'Operating Systems', 1, 3, ARRAY[1, 2], 4),
  ('CS105', 'Database Systems', 1, 3, ARRAY[1, 2], 4),
  ('CS106', 'Computer Networks', 1, 3, ARRAY[1, 2], 4),
  ('CS107', 'Computer Graphics', 1, 3, ARRAY[1, 2], 4),
  ('CS108', 'Computer Security', 1, 3, ARRAY[1, 2], 4),
  ('CS109', 'Artificial Intelligence', 1, 3, ARRAY[1, 2], 4),
  ('CS110', 'Computer Vision', 1, 3, ARRAY[1, 2], 4);



INSERT INTO university.Prerequisites_courses (course_code, prerequisite_code)
VALUES
  ('CS101', 'CS100'),
  ('CS102', 'CS101'),
  ('CS103', 'CS102'),
  ('CS104', 'CS103'),
  ('CS105', 'CS104'):


INSERT INTO university.Limited_courses (course_code, max_students)
VALUES
  ('CS101', 20),
  ('CS102', 20),
  ('CS103', 20),
  ('CS104', NULL),


INSERT INTO university.Grades (grade_symbol, grade_description)
VALUES 
  ('5', 'Excellent'),
  ('4', 'Good'),
  ('3', 'Pass'),
  ('U', 'Fail');



INSERT INTO university.Student_course_registrations (student_social_security_number, course_code)
VALUES
  ('1234567890', 'CS101'),
  ('1234567890', 'CS102'),
  ('1234567890', 'CS103'),
  ('1234567890', 'CS104');


INSERT INTO Students (social_security_number, name, program_id, branch_id, current_year, current_term, earned_credits)
  ('1234567890', '<NAME>', 1, 1, 2021, 1, 10),
  ('1234567891', '<NAME>', 1, 1, 2021, 1, 10),
  ('1234567892', '<NAME>', 1, 1, 2021, 1, 10);
  
  

INSERT INTO university.Waitlist (course_code, student_social_security_number)
VALUES
  ('CS101', '1234567890'),
  ('CS102', '1234567890'),
  ('CS103', '1234567890'),




INSERT INTO university.Study_administrators (name)
VALUES
  ('<NAME>');


INSERT INTO university.Override_logs (administrator_id, course_code, student_social_security_number)
VALUES
  (1, 'CS101', '1234567890');



INSERT INTO university.Program_mandatory_courses (program_id, course_code)
VALUES
  (1, 'CS101'),
  (1, 'CS102');



INSERT INTO university.Branch_mandatory_courses (branch_id, course_code)
VALUES
  (1, 'CS101'),
  (1, 'CS102');



INSERT INTO university.Branch_recommended_courses (branch_id, course_code)
VALUES
  (1, 'CS103'),
  (1, 'CS104');




INSERT INTO university.Classifications (name)
VALUES
  ('Undergraduate'),
  ('Graduate');


INSERT INTO university.Courses_classification (course_code, classification_id)
VALUES
('CS100', '1'),
('CS101', '2');


INSERT INTO TABLE university.Student_completed_courses(student_social_security_number,course_code, grade_id, completed_date)
VALUES
();