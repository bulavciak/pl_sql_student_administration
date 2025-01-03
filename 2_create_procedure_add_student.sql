CREATE OR REPLACE PROCEDURE add_student (
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_birth_date IN DATE,
    p_class IN VARCHAR2
) IS
BEGIN
    INSERT INTO students VALUES (
        student_seq.NEXTVAL,
        p_first_name,
        p_last_name,
        p_birth_date,
        p_class
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Chyba pri pridávaní študenta: ' || SQLERRM);
END;
