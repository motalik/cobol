       IDENTIFICATION DIVISION.
       PROGRAM-ID. screen.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 300-ACTIVE-SPACES VALUE SPACES.
       05 300-COMPANY-NAME PIC X(30).
       05 300-LAST-NAME PIC X(25).
       05 300-FIRST-NAME PIC X(15).
       05 300-MAIL-ADDRESS PIC X(30).
       01 300-IDNum PIC X(4).
       SCREEN SECTION.
       01 CLEAR-SCREEN.
       05 BLANK SCREEN BACKGROUND-COLOR 15 FOREGROUND-COLOR 0.
       01 INPUT-SCREEN AUTO.
       05 LINE 6 COLUMN 20 VALUE IS 'ID: '.
       05 using 300-IDNum REVERSE-VIDEO PIC X(30).
       05 LINE 7 COLUMN 20 VALUE IS 'Azienda: '.
       05 using 300-COMPANY-NAME REVERSE-VIDEO PIC X(30).
       05 LINE 8 COLUMN 20 VALUE IS 'Nome: '.
       05 using 300-FIRST-NAME REVERSE-VIDEO PIC X(25).
       05 LINE 9 COLUMN 20 VALUE IS 'Cognome: '.
       05 using 300-LAST-NAME REVERSE-VIDEO PIC X(15).
       05 LINE 10 COLUMN 20 VALUE IS 'Email: '.
       05 using 300-MAIL-ADDRESS REVERSE-VIDEO pic x(15).

       PROCEDURE DIVISION.
       100-MAIN-MODULE.

       MOVE SPACES TO 300-IDNum
                      300-COMPANY-NAME
                      300-FIRST-NAME
                      300-LAST-NAME
                      300-MAIL-ADDRESS.
      *cosi quando mttendo gli input e premo la freccia sotto lui mi va
      *nella posizione giusta per mettere il valore
       DISPLAY CLEAR-SCREEN.
       DISPLAY INPUT-SCREEN.
       ACCEPT INPUT-SCREEN.
       STOP RUN.
