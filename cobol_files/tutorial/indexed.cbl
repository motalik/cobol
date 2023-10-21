       IDENTIFICATION DIVISION.
       PROGRAM-ID. "INDEXED".
       DATE-WRITTEN. SABATO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMERFILE ASSIGN TO "customer.txt"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS IDNUM.
       DATA DIVISION.
       FILE SECTION.
       FD CUSTOMERFILE.
       01 CUSTOMERDATA.
           02 IDNUM PIC 9(5).
           02 FIRSTNAME PIC X(15).
           02 LASTNAME PIC X(15).
          
       WORKING-STORAGE SECTION.
       01 CHOICE PIC 9.
       01 STAYOPEN PIC X VALUE 'Y'.
       01 CUSTEXISTS PIC X.
       
       PROCEDURE DIVISION.
       STARTPARA.
           OPEN I-O CUSTOMERFILE
           PERFORM UNTIL STAYOPEN = 'N'
               DISPLAY " "
               DISPLAY "CUSTOMER RECORDS"
               DISPLAY "1: ADD CUSTOMER"
               DISPLAY "2: DELETE CUSTOMER"
               DISPLAY "3: UPDATE CUSTOMER"
               DISPLAY "4: GET CUSTOMER"
               DISPLAY "0: QUIT"
               DISPLAY ": " WITH NO ADVANCING
               ACCEPT CHOICE
               EVALUATE CHOICE
                   WHEN 1 PERFORM ADDCUST
                   WHEN 2 PERFORM DELETECUST
                   WHEN 3 PERFORM UPDATECUST
                   WHEN 4 PERFORM GETCUST
                   WHEN OTHER MOVE 'N' TO STAYOPEN
               END-EVALUATE
           END-PERFORM.
           CLOSE CUSTOMERFILE
           STOP RUN.
           
       ADDCUST.
           DISPLAY " "
           DISPLAY "ENTER ID : " WITH NO ADVANCING.
           ACCEPT IDNUM
           DISPLAY "ENTER FIRST NAME : " WITH NO ADVANCING.
           ACCEPT FIRSTNAME
           DISPLAY "ENTER LAST NAME : " WITH NO ADVANCING.
           ACCEPT LASTNAME
           DISPLAY " "
           WRITE CUSTOMERDATA
               INVALID KEY DISPLAY "ID TAKEN"
           END-WRITE.
       
       DELETECUST.
           DISPLAY " "
           DISPLAY "ENTER CUSTOMER ID TO DELETE : " WITH NO ADVANCING.
           ACCEPT IDNUM
           DELETE CUSTOMERFILE
               INVALID KEY DISPLAY "KEY DOESN'T EXIST"
           END-DELETE.
       
       UPDATECUST.
           MOVE 'Y' TO CUSTEXISTS
           DISPLAY " "
           DISPLAY "ENTER ID TO UPDATE : " WITH NO ADVANCING
           ACCEPT IDNUM
           READ CUSTOMERFILE
               INVALID KEY MOVE 'N' TO CUSTEXISTS
           END-READ.
           IF CUSTEXISTS = 'N'
               DISPLAY "CUSTOMER DOESN'T EXIST"
           ELSE
               DISPLAY "ENTER THE NEW FIRST NAME : " WITH NO ADVANCING
               ACCEPT FIRSTNAME
               DISPLAY "ENTER THE NEW LAST NAME : " WITH NO ADVANCING
               ACCEPT LASTNAME
           END-IF.
           REWRITE CUSTOMERDATA
               INVALID KEY DISPLAY "CUSTOMER NOT UPDATED"
           END-REWRITE.
       
       GETCUST.
           MOVE 'Y' TO CUSTEXISTS
           DISPLAY " "
           DISPLAY "ENTER CUSTOMER ID TO FIND : " WITH NO ADVANCING
           ACCEPT IDNUM
           READ CUSTOMERFILE
               INVALID KEY MOVE 'N' TO CUSTEXISTS
           END-READ.
           IF CUSTEXISTS = 'N'
               DISPLAY "CUSTOMER DOESN'T EXIST"
           ELSE
               DISPLAY "ID : " IDNUM
               DISPLAY "FIRST NAME : " FIRSTNAME
               DISPLAY "LAST NAME : " LASTNAME
           END-IF.
       
       END PROGRAM INDEXED.
