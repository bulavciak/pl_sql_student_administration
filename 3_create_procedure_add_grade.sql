CREATE OR REPLACE PROCEDURE add_grade (
    p_student_id IN NUMBER,
    p_subject IN VARCHAR2,
    p_grade IN NUMBER,
    p_grade_date IN DATE
) IS
    v_student_exists NUMBER;
    v_description VARCHAR2(4000);
BEGIN
    -- Kontrola existencie študenta
    SELECT COUNT(*) INTO v_student_exists
    FROM students
    WHERE student_id = p_student_id;
    
    IF v_student_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20007, 'Študent neexistuje');
    END IF;
    
    -- Validácie
    IF NOT validation_pkg.is_valid_grade(p_grade) THEN
        RAISE_APPLICATION_ERROR(-20008, 'Neplatná známka');
    END IF;
    
    IF NOT validation_pkg.is_valid_date(p_grade_date) THEN
        RAISE_APPLICATION_ERROR(-20009, 'Neplatný dátum známky');
    END IF;
    
    IF p_subject IS NULL OR LENGTH(TRIM(p_subject)) < 2 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Neplatný predmet');
    END IF;

    -- Vloženie známky
    INSERT INTO grades VALUES (
        grade_seq.NEXTVAL,
        p_student_id,
        TRIM(p_subject),
        p_grade,
        p_grade_date
    );
    
    v_description := 'Pridaná známka ' || p_grade || ' z predmetu ' || p_subject || 
                    ' študentovi ID: ' || p_student_id;
    log_action('ADD_GRADE', v_description);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        log_action('ADD_GRADE', 
                  'Chyba: ' || SQLERRM || ' pre študenta ID: ' || p_student_id,
                  'ERROR');
        RAISE_APPLICATION_ERROR(-20002, 'Chyba pri pridávaní známky: ' || SQLERRM);
END;
