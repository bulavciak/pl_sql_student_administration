# pl_sql_student_administration

EN
The system is used to manage students, their grades, and generate study results. It includes validation and logging of all operations.

Database structure

Tables

1. students
 - student_id (PK): NUMBER
 - first_name: VARCHAR2(50)
 - last_name: VARCHAR2(50)
 - birth_date: DATE
 - class: VARCHAR2(10)

2. grades
 - grade_id (PK): NUMBER
 - student_id (FK): NUMBER
 - subject: VARCHAR2(50)
 - grade: NUMBER(2,1)
 - grade_date: DATE

3. system_logs
 - log_id (PK): NUMBER
 - action_type: VARCHAR2(50)
 - action_description: VARCHAR2(4000)
 - user_name: VARCHAR2(50)
 - log_date: TIMESTAMP
 - status: VARCHAR2(20)

Sequences

- student_seq: for student IDs
- grade_seq: for grade IDs
- log_seq: for log IDs

Main components

Package validation_pkg

Functions:
- is_valid_name(): Check name validity
- is_valid_grade(): Check grade validity (1-5)
- is_valid_date(): Check date validity
- is_valid_class(): Check class format

Procedures and Functions

1. add_student
- Parameters: first_name, last_name, birth_date, class
- Purpose: Add a new student with validations

2. add_grade
- Parameters: student_id, subject, grade, grade_date
- Purpose: Add a grade to a student with validations

3. get_average
- Parameters: student_id, subject (optional)
- Return value: NUMBER
- Purpose: Calculate the grade point average

4. print_student_report
- Parameters: student_id
- Purpose: Generate a report of study results

5. log_action
- Parameters: action_type, description, status
- Purpose: Log system operations

6. view_logs
- Parameters: date_from, date_to, status
- Purpose: View system logs

Error codes

- -20001: General error when adding student
- -20002: General error when adding grade
- -20003: Invalid first name
- -20004: Invalid last name
- -20005: Invalid date of birth
- -20006: Invalid class
- -20007: Student does not exist
- -20008: Invalid grade
- -20009: Invalid grade date
- -20010: Invalid subject

Validation rules

1. First and last name:
- Minimum 2 characters
- Only letters, spaces and hyphens
- Cannot be null

2. Grade:
- Values ​​1-5
- Decimals allowed

3. Date:
- Cannot be in the future according to sysdate
- Cannot be before 1990

4. Class:
- Format: number.letter (e.g. 4.A)

Logging

The system logs:
- All successful operations
- All errors
- The user performing the operation
- The timestamp
- A detailed description of the operation

-----------------------------------------------------------------------------------------------------------------------------------------
SK
Systém slúži na správu študentov, ich známok a generovanie študijných výsledkov. Zahŕňa overenie a logovanie všetkých operácií.

Štruktúra databázy

Tabuľky

1. študenti
 - student_id (PK): NUMBER
 - first_name: VARCHAR2(50)
 - last_name: VARCHAR2(50)
 - birth_date: DATE
 - class: VARCHAR2(10)

2. známky
 - grade_id (PK): NUMBER
 - student_id (FK): NUMBER
 - subject: VARCHAR2(50)
 - grade: NUMBER(2,1)
 - grade_date: DATE

3. systémové_logy
 - log_id (PK): NUMBER
 - action_type: VARCHAR2(50)
 - action_description: VARCHAR2(4000)
 - user_name: VARCHAR2(50)
 - log_date: TIMESTAMP
 - status: VARCHAR2(20)

Sekvencie

- student_seq: pre študentské preukazy
- grade_seq: pre ID triedy
- log_seq: pre ID protokolu

Hlavné komponenty

Balík validation_pkg

Funkcie:
- is_valid_name(): Kontrola platnosti mena
- is_valid_grade(): Kontrola platnosti známky (1-5)
- is_valid_date(): Kontrola platnosti dátumu
- is_valid_class(): Kontrola formátu triedy

Procedúry a funkcie

1. add_student
- Parametre: meno, priezvisko, dátum narodenia, trieda
- Účel: Pridať nového študenta s overeniami

2. add_grade
- Parametre: students_id, subject, grade, grade_date
- Účel: Pridať známku študentovi s overeniami

3. get_average
- Parametre: student_id, predmet (voliteľné)
- Návratová hodnota: NUMBER
- Účel: Vypočítajte priemer známok

4. print_student_report
- Parametre: student_id
- Účel: Vygenerovať správu o výsledkoch štúdie

5. log_action
- Parametre: action_type, description, status
- Účel: Zaznamenať operácie systému

6. view_logs
- Parametre: dátum_od, dátum_do, stav
- Účel: Zobrazenie systémových denníkov

Chybové kódy

- -20001: Všeobecná chyba pri pridávaní študenta
- -20002: Všeobecná chyba pri pridávaní známky
- -20003: Neplatné krstné meno
- -20004: Neplatné priezvisko
- -20005: Neplatný dátum narodenia
- -20006: Neplatná trieda
- -20007: Študent neexistuje
- -20008: Neplatná známka
- -20009: Neplatný dátum známky
- -20010: Neplatný predmet

Pravidlá validácie

1. Meno a priezvisko:
- Minimálne 2 znaky
- Iba písmená, medzery a spojovníky
- Nemôže byť null

2. Známka:
- Hodnoty 1-5
- Povolené desatinné miesta

3. Dátumy:
- Nemôže byť v buducnosti podla sysdate
- Nemôže byť pred rokom 1990

4. trieda:
– Formát: číslo.písmeno (napr. 4.A)

Logovanie

Systém zaznamenáva:
- Všetky úspešné operácie
- Všetky chyby
- Používateľ vykonávajúci operáciu
- Časová pečiatka
- Podrobný popis operácie
