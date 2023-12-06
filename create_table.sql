CREATE SCHEMA IF NOT EXISTS university;



CREATE TABLE IF NOT EXISTS university.Institutions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    abbreviation VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS university.Programs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    code VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS university.program_institutions(
program_id INT,
FOREIGN KEY (program_id) REFERENCES university.Programs (id) ON DELETE CASCADE,
institution_id INT,
FOREIGN KEY (institution_id) REFERENCES university.Institutions (id) ON DELETE CASCADE,
PRIMARY KEY (program_id, institution_id)
);


CREATE TABLE IF NOT EXISTS university.Branches (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    Recommended_courses_requirment_minimum INT,
    program_id INT,
    FOREIGN KEY (program_id) REFERENCES university.Programs (id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS university.program_branches(
program_id INT,
branch_name VARCHAR(255),
PRIMARY KEY (program_id, branch_name),
FOREIGN KEY (program_id) REFERENCES university.Programs (id) ON DELETE CASCADE,
FOREIGN KEY (branch_name) REFERENCES university.Branches (name) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS university.Classifications (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS university.Courses (
    code VARCHAR(6) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    institution_id INT NOT NULL,
    FOREIGN KEY (institution_id) REFERENCES university.Institutions (id) ON DELETE CASCADE,
    credits INT NOT NULL,
    classification_ids INT[],
    FOREIGN KEY (classification_id) REFERENCES university.Classifications (id),
    grade_ceiling INT,
    FOREIGN KEY (grade_ceiling) REFERENCES Grades (id)
);


CREATE TABLE IF NOT EXISTS university.Prerequisites_courses (
    course_code VARCHAR(6),
    prerequisite_code VARCHAR(6),
    PRIMARY KEY (course_code, prerequisite_code),
    FOREIGN KEY (course_code) REFERENCES university.Courses (code),
    FOREIGN KEY (prerequisite_code) REFERENCES university.Courses (code)
);


CREATE TABLE IF NOT EXISTS university.Limited_courses (
    course_code VARCHAR(6) PRIMARY KEY,
    max_students INT NOT NULL,
    FOREIGN KEY (course_code) REFERENCES university.Courses (code) ON DELETE CASCADE,
    waitlist_id INT,
    FOREIGN KEY (waitlist_id) REFERENCES university.yWaitlist (id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS university.Grades (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(1) NOT NULL,
    grade_description VARCHAR(255) NOT NULL
);



CREATE TABLE IF NOT EXISTS university.Student_course_registrations (
    id SERIAL PRIMARY KEY,
    student_social_security_number VARCHAR(10) NOT NULL,
    FOREIGN KEY (student_social_security_number) REFERENCES university.Students (social_security_number) ON DELETE CASCADE,
    course_code VARCHAR(6),
    FOREIGN KEY (course_code) REFERENCES university.Courses (course_code),
    registration_date DATE DEFAULT CURRENT_DATE,
);


CREATE TABLE IF NOT EXISTS Students (
    social_security_number VARCHAR(10) PRIMARY KEY UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    program_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES university.Programs (id) ON DELETE CASCADE,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES university.Branches (id),
    current_year INT,
    current_term INT,
    earned_credits INT,
    graduation_requirements_fulfilled BOOLEAN DEFAULT FALSE,
    CHECK (LENGTH(social_security_number) = 10)
);

  
  CREATE TABLE IF NOT EXISTS university.Waitlist (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(6),
    FOREIGN KEY (course_code) REFERENCES university.Limited_courses (course_code) ON DELETE CASCADE,
    student_social_security_number VARCHAR(10),
    FOREIGN KEY (student_social_security_number) REFERENCES university.Students (social_security_number) ON DELETE CASCADE
    registration_date DATE DEFAULT CURRENT_DATE,
);


CREATE TABLE IF NOT EXISTS university.Study_administrators (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS university.Override_logs (
    id SERIAL PRIMARY KEY,
    administrator_id INT,
    FOREIGN KEY (administrator_id) REFERENCES university.StudyAdministrators (administrator_id) ON DELETE CASCADE,
    course_code VARCHAR(6),
    FOREIGN KEY (course_code) REFERENCES Courses (code) ON DELETE CASCADE,
    student_social_security_number VARCHAR(10),
    FOREIGN KEY (student_social_security_number) REFERENCES university.Students (social_security_number) ON DELETE CASCADE,
    override_date DATE DEFAULT CURRENT_DATE,
);


CREATE TABLE IF NOT EXISTS university.Program_mandatory_courses (
    program_id INT,
    FOREIGN KEY (program_id) REFERENCES university.Programs (id) ON DELETE CASCADE,
    course_code VARCHAR(6),
    FOREIGN KEY (course_code) REFERENCES university.Courses (code) ON DELETE CASCADE,
    PRIMARY KEY (program_id, course_code),
);


CREATE TABLE IF NOT EXISTS university.Branch_mandatory_courses (
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES university.Branches (id) ON DELETE CASCADE,
    course_code VARCHAR(6),
    FOREIGN KEY (course_code) REFERENCES university.Courses (code) ON DELETE CASCADE,
    PRIMARY KEY (branch_id, course_code),
);


CREATE TABLE IF NOT EXISTS university.Branch_recommended_courses (
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES university.Branches (id) ON DELETE CASCADE,
    course_code VARCHAR(6),
    FOREIGN KEY (course_code) REFERENCES university.Courses (code) ON DELETE CASCADE,
    PRIMARY KEY (branch_id, course_code),
);





CREATE TABLE IF NOT EXISTS university.Courses_classification (
    course_code VARCHAR(6),
    FOREIGN KEY (course_code) REFERENCES university.Courses (code) ON DELETE CASCADE,
    classification_id INT,
    FOREIGN KEY (classification_id) REFERENCES university.CourseClassifications (id) ON DELETE CASCADE,
    PRIMARY KEY (course_code, classification_id)
);


CREATE TABLE IF NOT EXISTS university.Student_completed_courses(
  student_social_security_number VARCHAR(10),
  FOREIGN KEY (student_social_security_number) REFERENCES university.Students (social_security_number) ON DELETE CASCADE,
  course_code VARCHAR(6),
  FOREIGN KEY (course_code) REFERENCES university.Courses (code) ON DELETE CASCADE,
  PRIMARY KEY (student_social_security_number, course_code),
  grade_id INT,
  FOREIGN KEY (grade_id) REFERENCES university.Grades (id) ON DELETE CASCADE,
  completed_date DATE DEFAULT CURRENT_DATE
);
