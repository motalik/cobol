       IDENTIFICATION DIVISION.
       PROGRAM-ID. trangolo.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 lati.
           02 a pic 99.
           02 b pic 99.
           02 c pic 99.
       PROCEDURE DIVISION.
       display "Inserisci l'ipotenusa, il cateto 1 e il cateto 2: "
       accept lati
       if a > 0 and b > 0 and c > 0 then
           if a + b >= c and b + c >= a and a + c >= b
               if a = b and b = c
                   display "Il triangolo è equilatero"
               if a = b or b = c or a = c
                   display "Il triangolo è isoscele"
               else
                   display "Il triangolo è scaleno"
               end-if
           else
               display "Non è un triangolo!"
           end-if
       else
           display "Impossibile!"
       end-if.
       stop run.
       end program trangolo.
*
