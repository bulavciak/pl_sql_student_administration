-- add student - Pridanie študenta
BEGIN
    add_student('Jano', 'Novák', TO_DATE('2000-01-01', 'YYYY-MM-DD'), '4.A');
END;
/

-- add grade - Pridanie známky
BEGIN
    add_grade(1, 'Matematika', 1, SYSDATE);
    add_grade(1, 'Matematika', 4, SYSDATE);
    add_grade(1, 'Slovenčina', 2, SYSDATE);
    add_grade(1, 'Slovenčina', 1, SYSDATE);
END;

-- logs last 7 days
BEGIN
    view_logs(SYSDATE-7, SYSDATE); -- logy za posledný týždeň
END;

-- select average - Zistenie priemeru
SELECT get_average(1) AS celkovy_priemer FROM dual;
SELECT get_average(1, 'Matematika') AS priemer_z_matematiky FROM dual;
