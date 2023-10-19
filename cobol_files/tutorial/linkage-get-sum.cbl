       identification division.
       program-id. "linkage-get-sum".
       date-written. sabato.
       environment division.
       data division.
           linkage section.
               01 Lnum1 pic 99.
               01 Lnum2 pic 99.
               01 Lsum1 pic 999.
      *si elimina working storage section
       procedure division using Lnum1, Lnum2, Lsum1.
       1000-start-here.
       display "Inserisci num1: "
       accept Lnum1
       display "Inserisci num2: "
       accept Lnum2
       compute Lsum1=Lnum1+Lnum2
       exit program.
           
       stop run.
       end program linkage-get-sum.
       