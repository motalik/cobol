       IDENTIFICATION DIVISION.
       PROGRAM-ID. screen-cbl.

       ENVIRONMENT DIVISION.
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

       FD ReportFile
          BLOCK CONTAINS 0 RECORDS
          RECORDING MODE F.
          01 PrintLine PIC X(200).
          01 filler PIC X VALUE SPACE.
          01 PrintCustID PIC 9(20).
          01 filler PIC X VALUE SPACE.
          01 PrintFirstName PIC X(50).
          01 filler PIC X VALUE SPACE.
          01 PrintLastName PIC X(55).
          01 filler PIC X VALUE SPACE.
          01 PrintAzienda PIC X(50).
          01 filler PIC X VALUE SPACE.
          01 PrintEmail PIC X(50).
       

       WORKING-STORAGE SECTION.
       01 WS-IDNum PIC X(4).
       01 WS-Company-Name PIC X(30).
       01 WS-First-Name PIC X(15).
       01 WS-Last-Name PIC X(25).
       01 WS-Mail-Address PIC X(30).

       01 PageHeading.
          02 filler PIC X(40) VALUE "         ---Customer List---".
       01 PageFooting.
          02 Filler PIC X(15) VALUE SPACES.
          02 filler PIC X(7) VALUE "Page : ".
          02 PrnPageNum PIC Z9.

       01 InformazioniUtente.
          02 filler PIC X VALUE SPACE.
          02 PrnCustID PIC 9(4).
          02 filler PIC X VALUE SPACE.
          02 PrnFirstName PIC X(16).
          02 filler PIC X VALUE SPACE.
          02 PrnLastName PIC X(55).
          02 filler PIC X VALUE SPACE.
          02 PrnAzienda PIC X(30).
          02 filler PIC X VALUE SPACE.
          02 PrnEmail PIC X(50).

       01 ReportFooting PIC X(13) VALUE "End of report".
       01 LineCount PIC 99 VALUE ZERO.
       01 NewPageRequired PIC 99 VALUE 0.
       01 PageCount PIC 99 VALUE ZERO.
       01 WSEOF PIC 9 VALUE 0.
       SCREEN SECTION.
       01 CLEAR-SCREEN.
          05 BLANK SCREEN.
       01 INPUT-SCREEN.
          02 LINE 6 COLUMN 20 VALUE IS 'ID: '.
          02 COLUMN 24 PIC X(4) USING WS-IDNum.
          02 LINE 7 COLUMN 20 VALUE IS 'Azienda: '.
          02 COLUMN 28 PIC X(30) USING WS-Company-Name.
          02 LINE 8 COLUMN 20 VALUE IS 'Nome: '.
          02 COLUMN 25 PIC X(15) USING WS-First-Name.
          02 LINE 9 COLUMN 20 VALUE IS 'Cognome: '.
          02 COLUMN 30 PIC X(25) USING WS-Last-Name.
          02 LINE 10 COLUMN 20 VALUE IS 'Email: '.
          02 COLUMN 28 PIC X(30) USING WS-Mail-Address.

       PROCEDURE DIVISION.
       100-MAIN-MODULE.
          DISPLAY CLEAR-SCREEN
          DISPLAY INPUT-SCREEN
          ACCEPT INPUT-SCREEN
          OPEN OUTPUT DatiUtenteFile
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
          READ DatiUtenteFile AT END SET WSEOF TO 1
          END-READ
          PERFORM UNTIL WSEOF = 1
              PERFORM PrintReportBody
          END-PERFORM
          WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5 LINES
          CLOSE DatiUtenteFile, ReportFile.
          STOP RUN.
       PrintPageHeading.
          WRITE PrintLine FROM PageHeading AFTER ADVANCING Page
          MOVE 3 TO LineCount
          ADD 1 TO PageCount.

       PrintReportBody.
          IF LineCount IS GREATER THAN 40
              MOVE 1 TO PrnPageNum
              MOVE 0 TO LineCount
              WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
              PERFORM PrintPageHeading
          END-IF.
          MOVE IDNum TO PrnCustID
          MOVE FIRST-NAME TO PrnFirstName
          MOVE LAST-NAME TO PrnLastName
          MOVE COMPANY-NAME TO PrnAzienda
          MOVE MAIL-ADDRESS TO PrnEmail
          MOVE "IDNum: " TO PrintLine
          MOVE PrnCustID TO PrintCustID(10:20)
          write PrintCustID after advancing 1 line  
          MOVE "Azienda: " TO PrintLine
          MOVE PrnAzienda TO PrintAzienda(10:50)
          write PrintAzienda after advancing 1 line
          MOVE "Nome: " TO PrintLine
          MOVE PrnFirstName TO PrintFirstName(10:50)
          write PrintFirstName after advancing 1 line
          MOVE "Cognome: " TO PrintLine
          MOVE PrnLastName TO PrintLastName(10:50)
          write PrintLastName after advancing 1 line
          MOVE "Email: " TO PrintLine
          MOVE PrnEmail TO PrintEmail(10:50)
          write PrintEmail after advancing 1 line
          ADD 1 TO LineCount
          READ DatiUtenteFile AT END SET WSEOF TO 1
          END-READ.
       STOP RUN.
