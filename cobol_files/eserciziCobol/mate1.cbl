      * find the difference between the square of the sum and the sum 
      *of the squares of the first N natural numbers
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mate1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N pic 99.
       01 somma pic 9(4) value 0.
       01 risultato pic 9(8) value 0.
       01 I pic 99 value 0.
       PROCEDURE DIVISION.
       display "Inserisci un numero: "
       accept N
       perform varying I from 1 by 1 until I > N
           compute somma = somma + I
       end-perform.

       compute risultato = somma**2 - somma
       display risultato.

       stop run.
       end program mate1.

