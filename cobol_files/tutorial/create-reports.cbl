       IDENTIFICATION DIVISION.
       PROGRAM-ID. screen-cbl.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT DatiUtenteFile ASSIGN TO "DatiUtente.dat"
           ORGANIZATION IS SEQUENTIAL
           ACCESS IS SEQUENTIAL.
       SELECT ReportFile ASSIGN TO "Report.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD DatiUtenteFile.
       01 DatiUtenteRecord.
          02 IDNum PIC X(4).
          02 COMPANY-NAME PIC X(30).
          02 FIRST-NAME PIC X(15).
          02 LAST-NAME PIC X(25).
          02 MAIL-ADDRESS PIC X(30).

       FD ReportFile.
       01 ReportLine PIC X(80).

       ...

       PROCEDURE DIVISION.
       100-MAIN-MODULE.
          OPEN OUTPUT DatiUtenteFile
          DISPLAY CLEAR-SCREEN
          DISPLAY INPUT-SCREEN
          ACCEPT INPUT-SCREEN
          MOVE WS-IDNum TO IDNum
          MOVE WS-Company-Name TO COMPANY-NAME
          MOVE WS-First-Name TO FIRST-NAME
          MOVE WS-Last-Name TO LAST-NAME
          MOVE WS-Mail-Address TO MAIL-ADDRESS
          WRITE DatiUtenteRecord
          END-WRITE
          CLOSE DatiUtenteFile

          OPEN INPUT DatiUtenteFile
          OPEN OUTPUT ReportFile
          PERFORM PrintPageHeading
          READ DatiUtenteFile AT END
          PERFORM PrintReportBody
          END-READ
          WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5 LINES
          CLOSE DatiUtenteFile ReportFile
          STOP RUN.
