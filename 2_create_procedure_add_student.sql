CREATE OR REPLACE PROCEDURE add_student (
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_birth_date IN DATE,
    p_class IN VARCHAR2
) IS
    v_description VARCHAR2(4000);
BEGIN
    -- Validácie
    IF NOT validation_pkg.is_valid_name(p_first_name) THEN
        RAISE_APPLICATION_ERROR(-20003, 'Neplatné meno');
    END IF;
    
    IF NOT validation_pkg.is_valid_name(p_last_name) THEN
        RAISE_APPLICATION_ERROR(-20004, 'Neplatné priezvisko');
    END IF;
    
    IF NOT validation_pkg.is_valid_date(p_birth_date) THEN
        RAISE_APPLICATION_ERROR(-20005, 'Neplatný dátum narodenia');
    END IF;
    
    IF NOT validation_pkg.is_valid_class(p_class) THEN
        RAISE_APPLICATION_ERROR(-20006, 'Neplatná trieda');
    END IF;

    -- Vloženie študenta
    INSERT INTO students VALUES (
        student_seq.NEXTVAL,
        TRIM(p_first_name),
        TRIM(p_last_name),
        p_birth_date,
        UPPER(p_class)
    );
    
    v_description := 'Pridaný študent: ' || p_first_name || ' ' || p_last_name;
    log_action('ADD_STUDENT', v_description);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        log_action('ADD_STUDENT', 
                  'Chyba: ' || SQLERRM || ' pre študenta: ' || p_first_name || ' ' || p_last_name,
                  'ERROR');
        RAISE_APPLICATION_ERROR(-20001, 'Chyba pri pridávaní študenta: ' || SQLERRM);
END;
