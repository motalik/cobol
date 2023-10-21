       identification division.
       PROGRAM-ID. "write-to-file".
       date-written. sabato.
       environment division.
       input-output section.
       file-control.
           select CustomerFile assign to "Customer.dat"
               organization is line sequential
               access is sequential.

       data division.
       file section.
       FD CustomerFile.
           01 CustomerData.
               02 IDNum pic 9(5).
               02 CustName.
                   03 FirstName pic x(15).
                   03 LastName pic x(15).
           01 WSEOF pic A(1).
      *file description
       working-storage section.
           01 WSCustomer.
               02 WSIDNum pic 9(5).
               02 WSCustName.
                   03 WSFirstName pic x(15).
                   03 WSLastName pic x(15). 
       procedure division.
       1000-start-here.
      *     open extend CustomerFile.
      *         display "Inserisci ID: " with no advancing
      *         accept IDNum
      *         display "Inserisci il nome: " with no advancing
      *         accept FirstName
      *         display "Inserisci il cognome: " with no advancing
      *         accept LastName
      *         write CustomerData
      *         end-write.
      *     close CustomerFile.
           open input CustomerFile.
               perform until WSEOF='Y'
                   read CustomerFile into WSCustomer
                       at end move 'Y' to WSEOF
                       not at end display WSCustomer
                   end-read
               end-perform
           close CustomerFile.
       stop run.
       end program write-to-file.
       