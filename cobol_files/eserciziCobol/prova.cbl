       identification division.
       program-id. "prova".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
           01 num1 pic 999.
           01 num2 pic 999.
           01 risultato pic 9999V9999.
       procedure division.
       1000-start-here.
           display "Inserisci numero 1: ".
           accept num1.
           display "Inserisci numero 2: ".
           accept num2.
           compute risultato = num1 / (num2*num2)*10000.
           display "Il risultato è: " risultato.
       stop run.
       end program prova.
       