       IDENTIFICATION DIVISION.
       PROGRAM-ID. 'screen-cbl'.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       select FileUtenti assign to 'DatiUtente.dat'
           organization is sequential
           access is sequential.
       DATA DIVISION.
       FILE SECTION.
       FD FileUtenti.
           01 DatiUtenti.
               02 IDNum pic x(4).
               02 COMPANY-NAME PIC X(30).
               02 FIRST-NAME pic x(15).
               02 LAST-NAME pic x(25).
              02 MAIL-ADDRESS PIC X(30).
       WORKING-STORAGE SECTION.
       01 WS-DatiUtenti.
              02 300-ACTIVE-SPACES VALUE SPACES.
              02 300-COMPANY-NAME PIC X(30).
              02 300-LAST-NAME PIC X(25).
              02 300-FIRST-NAME PIC X(15).
              02 300-MAIL-ADDRESS PIC X(30).
              02 300-IDNum PIC X(4).
       SCREEN SECTION.
      
       01 CLEAR-SCREEN.
       05 BLANK SCREEN BACKGROUND-COLOR 15 FOREGROUND-COLOR 0.
       01 INPUT-SCREEN AUTO.
       02 LINE 6 COLUMN 20 VALUE IS 'ID: '.
       02 using 300-IDNum REVERSE-VIDEO PIC X(30).
       02 LINE 7 COLUMN 20 VALUE IS 'Azienda: '.
       02 using 300-COMPANY-NAME REVERSE-VIDEO PIC X(30).
       02 LINE 8 COLUMN 20 VALUE IS 'Nome: '.
       02 using 300-FIRST-NAME REVERSE-VIDEO PIC X(25).
       02 LINE 9 COLUMN 20 VALUE IS 'Cognome: '.
       02 using 300-LAST-NAME REVERSE-VIDEO PIC X(15).
       02 LINE 10 COLUMN 20 VALUE IS 'Email: '.
       02 using 300-MAIL-ADDRESS REVERSE-VIDEO pic x(15).

       PROCEDURE DIVISION.
       100-MAIN-MODULE.
       open extend FileUtenti
              MOVE SPACES TO 300-IDNum 
              300-COMPANY-NAME
              300-FIRST-NAME
              300-LAST-NAME
              300-MAIL-ADDRESS.
      *cosi quando mttendo gli input e premo la freccia sotto lui mi va
      *nella posizione giusta per mettere il valore
              DISPLAY CLEAR-SCREEN
              DISPLAY INPUT-SCREEN
              ACCEPT INPUT-SCREEN
                     write DatiUtenti
                     end-write.
       close FileUtenti.
       STOP RUN.
       end program screen-cbl.
