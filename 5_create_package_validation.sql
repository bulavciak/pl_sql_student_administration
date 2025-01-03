CREATE OR REPLACE PACKAGE validation_pkg IS
    -- Validácia mena
    FUNCTION is_valid_name(p_name IN VARCHAR2) RETURN BOOLEAN;
    -- Validácia známky
    FUNCTION is_valid_grade(p_grade IN NUMBER) RETURN BOOLEAN;
    -- Validácia dátumu
    FUNCTION is_valid_date(p_date IN DATE) RETURN BOOLEAN;
    -- Validácia triedy
    FUNCTION is_valid_class(p_class IN VARCHAR2) RETURN BOOLEAN;
END validation_pkg;
/

CREATE OR REPLACE PACKAGE BODY validation_pkg IS
    FUNCTION is_valid_name(p_name IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN
        RETURN p_name IS NOT NULL 
            AND LENGTH(TRIM(p_name)) >= 2 
            AND REGEXP_LIKE(p_name, '^[A-Za-zÀ-ž\s-]+$');
    END;

    FUNCTION is_valid_grade(p_grade IN NUMBER) RETURN BOOLEAN IS
    BEGIN
        RETURN p_grade BETWEEN 1 AND 5;
    END;

    FUNCTION is_valid_date(p_date IN DATE) RETURN BOOLEAN IS
    BEGIN
        RETURN p_date <= SYSDATE 
            AND p_date >= TO_DATE('1990-01-01', 'YYYY-MM-DD');
    END;

    FUNCTION is_valid_class(p_class IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN
        RETURN REGEXP_LIKE(p_class, '^[1-9]\.[A-Z]$');
    END;
END validation_pkg;
