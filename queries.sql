•	Två grenar med samma namn, fast på olika program.
SELECT * FORM Program_Branches WHERE Branches_Names = 

•	En student som inte har tagit några kurser.
SELECT * FORM Student WHERE COUNT(SELECT Student_social_security_number FROM Student_completed_courses) < 1
AND COUNT(SELECT Student_social_security_number FROM Student_course_registrations) < 1;

•	En student som bara har fått underkänt.
SELECT grade_id FROM Student_completed_courses

•	En student som inte har valt någon gren.
SELECT * FROM Student WHERE branch_id IS NULL;

•	En väntelista kan bara finnas för platsbegränsade kurser.

•	Och så vidare..


