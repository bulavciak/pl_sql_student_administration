CREATE OR REPLACE PROCEDURE add_grade (
    p_student_id IN NUMBER,
    p_subject IN VARCHAR2,
    p_grade IN NUMBER,
    p_grade_date IN DATE
) IS
BEGIN
    INSERT INTO grades VALUES (
        grade_seq.NEXTVAL,
        p_student_id,
        p_subject,
        p_grade,
        p_grade_date
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Chyba pri pridávaní známky: ' || SQLERRM);
END;
