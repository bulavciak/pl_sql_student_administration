CREATE OR REPLACE PROCEDURE log_action (
    p_action_type IN VARCHAR2,
    p_description IN VARCHAR2,
    p_status IN VARCHAR2 DEFAULT 'SUCCESS'
) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO system_logs VALUES (
        log_seq.NEXTVAL,
        p_action_type,
        p_description,
        USER,
        SYSTIMESTAMP,
        p_status
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Chyba pri logovaní: ' || SQLERRM);
END;
