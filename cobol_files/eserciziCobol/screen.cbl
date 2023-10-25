       IDENTIFICATION DIVISION.
       PROGRAM-ID. screen-cbl.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT FileUtenti ASSIGN TO "DatiUtente.dat"
           ORGANIZATION IS SEQUENTIAL
           ACCESS IS SEQUENTIAL.
       SELECT ReportUtente ASSIGN TO "ReportUtente.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD FileUtenti.
       01 DatiUtenti.
          02 IDNum PIC X(4).
          02 COMPANY-NAME PIC X(30).
          02 FIRST-NAME PIC X(15).
          02 LAST-NAME PIC X(25).
          02 MAIL-ADDRESS PIC X(30).

       FD FileUtente.  <<--- Define the FileUtente file description
       01 YourFileRecord.
          02 ...  <<-- Define the structure of records in FileUtente

       WORKING-STORAGE SECTION.
       01 WS-DatiUtenti.
          02 WS-Active-Spaces VALUE SPACES.
          02 WS-Company-Name PIC X(30).
          02 WS-Last-Name PIC X(25).
          02 WS-First-Name PIC X(15).
          02 WS-Mail-Address PIC X(30).
          02 WS-IDNum PIC X(4).

       01 PageHeading.
          02 filler PIC X(13) VALUE "Customer List".
       01 PageFooting.
          02 Filler PIC X(15) VALUE SPACES.
          02 filler PIC X(7) VALUE "Page : ".
          02 PrnPageNum PIC Z9.

       01 Heads PIC X(36) VALUE "IDNum     FirstName     LastName".
       01 InformazioniUtente.
          02 filler PIC X VALUE SPACE.
          02 PrnCustID PIC 9(5).
          02 filler PIC X(4) VALUE SPACE.
          02 PrnFirstName PIC X(15).
          02 filler PIC XX VALUE SPACE.
          02 PrnLastName PIC X(15).

       01 ReportFooting PIC X(13) VALUE "End of report".
       01 LineCount PIC 99 VALUE ZERO.
          88 NewPageRequired VALUE 40 THRU 99.
       01 PageCount PIC 99 VALUE ZERO.

       01 WSEOF PIC X VALUE 'N'.  <<-- Define WSEOF

       SCREEN SECTION.
       01 CLEAR-SCREEN.
          05 BLANK SCREEN BACKGROUND-COLOR 15 FOREGROUND-COLOR 0.
       01 INPUT-SCREEN AUTO.
          02 LINE 6 COLUMN 20 VALUE IS 'ID: '.
          02 USING WS-IDNum REVERSE-VIDEO PIC X(4).
          02 LINE 7 COLUMN 20 VALUE IS 'Azienda: '.
          02 USING WS-Company-Name REVERSE-VIDEO PIC X(30).
          02 LINE 8 COLUMN 20 VALUE IS 'Nome: '.
          02 USING WS-First-Name REVERSE-VIDEO PIC X(15).
          02 LINE 9 COLUMN 20 VALUE IS 'Cognome: '.
          02 USING WS-Last-Name REVERSE-VIDEO PIC X(25).
          02 LINE 10 COLUMN 20 VALUE IS 'Email: '.
          02 USING WS-Mail-Address REVERSE-VIDEO PIC X(30).

       PROCEDURE DIVISION.
       100-MAIN-MODULE.
          OPEN OUTPUT FileUtenti
          MOVE SPACES TO WS-IDNum
                      WS-Company-Name
                      WS-First-Name
                      WS-Last-Name
                      WS-Mail-Address
          DISPLAY CLEAR-SCREEN
          DISPLAY INPUT-SCREEN
          ACCEPT INPUT-SCREEN
          MOVE WS-IDNum TO IDNum
          MOVE WS-Company-Name TO COMPANY-NAME
          MOVE WS-First-Name TO FIRST-NAME
          MOVE WS-Last-Name TO LAST-NAME
          MOVE WS-Mail-Address TO MAIL-ADDRESS
          WRITE DatiUtenti
          END-WRITE
          CLOSE FileUtenti

          OPEN INPUT FileUtente
          OPEN OUTPUT ReportUtente
          PERFORM PrintPageHeading
          READ FileUtente AT END SET WSEOF TO 'Y'  <<-- Set WSEOF to 'Y' when end of file is reached
          END-READ
          PERFORM PrintReportBody UNTIL WSEOF = 'Y'  <<-- Check if WSEOF is 'Y'
          WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5 LINES
          CLOSE FileUtente ReportUtente
          STOP RUN.

       PrintPageHeading.
          WRITE PrintLine FROM PageHeading AFTER ADVANCING Page
          WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES
          MOVE 3 TO LineCount
          ADD 1 TO PageCount.

       PrintReportBody.
          IF NewPageRequired
              MOVE PageCount TO PrnPageNum
              WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
              PERFORM PrintPageHeading
          END-IF
          MOVE IDNum TO PrnCustID
          MOVE FIRST-NAME TO PrnFirstName
          MOVE LAST-NAME TO PrnLastName
          WRITE PrintLine FROM InformazioniUtente AFTER ADVANCING 1 LINE
          ADD 1 TO LineCount
          READ FileUtente AT END SET WSEOF TO 'Y'  <<-- Set WSEOF to 'Y' when end of file is reached
          END-READ.
       STOP RUN.
