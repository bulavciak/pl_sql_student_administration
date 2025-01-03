CREATE OR REPLACE PROCEDURE print_student_report (
    p_student_id IN NUMBER
) IS
    v_first_name students.first_name%TYPE;
    v_last_name students.last_name%TYPE;
    v_average NUMBER;
BEGIN
    -- Získanie mena študenta
    SELECT first_name, last_name INTO v_first_name, v_last_name
    FROM students
    WHERE student_id = p_student_id;
    
    -- Výpis hlavičky
    DBMS_OUTPUT.PUT_LINE('Report študenta: ' || v_first_name || ' ' || v_last_name);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    
    -- Výpis známok po predmetoch
    FOR rec IN (
        SELECT subject, AVG(grade) as avg_grade
        FROM grades
        WHERE student_id = p_student_id
        GROUP BY subject
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.subject || ': ' || ROUND(rec.avg_grade, 2));
    END LOOP;
    
    -- Celkový priemer
    v_average := get_average(p_student_id);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Celkový priemer: ' || v_average);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Študent nebol nájdený');
END;
