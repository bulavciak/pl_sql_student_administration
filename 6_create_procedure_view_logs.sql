CREATE OR REPLACE PROCEDURE view_logs (
    p_date_from IN DATE DEFAULT TRUNC(SYSDATE),
    p_date_to IN DATE DEFAULT SYSDATE,
    p_status IN VARCHAR2 DEFAULT NULL
) IS
BEGIN
    FOR rec IN (
        SELECT log_id,
               action_type,
               action_description,
               user_name,
               log_date,
               status
        FROM system_logs
        WHERE log_date BETWEEN p_date_from AND p_date_to
        AND (p_status IS NULL OR status = p_status)
        ORDER BY log_date DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Log ID: ' || rec.log_id);
        DBMS_OUTPUT.PUT_LINE('Akcia: ' || rec.action_type);
        DBMS_OUTPUT.PUT_LINE('Popis: ' || rec.action_description);
        DBMS_OUTPUT.PUT_LINE('Užívateľ: ' || rec.user_name);
        DBMS_OUTPUT.PUT_LINE('Dátum: ' || TO_CHAR(rec.log_date, 'DD.MM.YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Status: ' || rec.status);
    END LOOP;
END;
