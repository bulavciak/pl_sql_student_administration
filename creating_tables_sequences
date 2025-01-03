-- create tables and sequences - Vytvorenie tabuliek
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    birth_date DATE,
    class VARCHAR2(10)
);

CREATE TABLE grades (
    grade_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    subject VARCHAR2(50),
    grade NUMBER(2,1),
    grade_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE system_logs (
    log_id NUMBER PRIMARY KEY,
    action_type VARCHAR2(50),
    action_description VARCHAR2(4000),
    user_name VARCHAR2(50),
    log_date TIMESTAMP,
    status VARCHAR2(20)
);

CREATE SEQUENCE log_seq START WITH 1;
CREATE SEQUENCE student_seq START WITH 1;
CREATE SEQUENCE grade_seq START WITH 1;
