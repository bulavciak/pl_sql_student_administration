CREATE OR REPLACE FUNCTION get_average (
    p_student_id IN NUMBER,
    p_subject IN VARCHAR2 DEFAULT NULL
) RETURN NUMBER IS
    v_average NUMBER;
BEGIN
    IF p_subject IS NULL THEN
        -- Celkový priemer
        SELECT AVG(grade) INTO v_average
        FROM grades
        WHERE student_id = p_student_id;
    ELSE
        -- Priemer z predmetu
        SELECT AVG(grade) INTO v_average
        FROM grades
        WHERE student_id = p_student_id
        AND subject = p_subject;
    END IF;
    
    RETURN ROUND(v_average, 2);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
