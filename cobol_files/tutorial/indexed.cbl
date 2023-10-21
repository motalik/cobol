       identification division.
       PROGRAM-ID. "indexed".
       date-written. sabato.
       environment division.
       input-output section.
       file-control.
           select CustomerFile assign to "customer.txt"
               organization is indexed
               access mode is random
               record key is IDNum.
       data division.
       file section.
       FD CustomerFile.
       01 CustomerData.
           02 IDNum pic 9(5).
           02 FirstName pic x(15).
           02 LastName pic x(15).
          
       working-storage section.
       01 Choice pic 9.
       01 StayOpen pic x value 'Y'.
       01 CustExists pic X.
       
       procedure division.
       StartPara.
           open i-o CustomerFile
           perform until StayOpen='N'
               display " "
               display "CUSTOMER RECORDS"
               display "1: Add Customer"
               display "2: Delete Customer"
               display "3: Update Customer"
               display "4: Get Customer"
               display "0: Quit"
               display ": " with no advancing
               accept Choice
               evaluate Choice
                   when 1 perform AddCust
                   when 2 perform DeleteCust
                   when 3 perform UpdateCust
                   when 4 perform GetCust
                   when other move 'N' to StayOpen
               end-evaluate
           end-perform.
           close CustomerFile
           stop run.
           
       AddCust.
           display " "
           display "Enter ID : " with no advancing.
           accept IDNum
           display "Enter First Name : " with no advancing.
           accept FirstName
           display "Enter Last Name : " with no advancing.
           accept LastName
           display " "
           write CustomerData
               invalid key display "ID Taken"
           end-write.
       
       DeleteCust.
           display " "
           display "Enter Customer ID to Delete : " with no advancing.
           accept IDNum
           delete CustomerFile
               invalid key display "Key Doesn't Exist"
           end-delete.
       
       UpdateCust.
           move 'Y' to CustExists
           display " "
           display "Enter ID to Update : " with no advancing
           accept IDNum
           read CustomerFile
               invalid key move 'N' to CustExists
           end-read.
           if CustExists = 'N'
               display "Customer Doesn't Exist"
           else
               display "Enter the New First Name : " with no advancing
               accept FirstName
               display "Enter the New Last Name : " with no advancing
               accept LastName
           end-if.
           rewrite CustomerData
               invalid key display "Customer Not Updated"
           end-rewrite.
       
       GetCust.
           move 'Y' to CustExists
           display " "
           display "Enter Customer Id to Find : " with no advancing
           accept IDNum
           read CustomerFile
               invalid key move 'N' to CustExists
           end-read.
           if CustExists='N'
               display "Customer Doesn't Exist"
           else
               display "ID : " IDNum
               display "First Name : " FirstName
               display "Last Name : " LastName
           end-if.
       
       end program indexed.
      *************************************** 



