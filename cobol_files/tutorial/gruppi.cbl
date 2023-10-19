       identification division.
       program-id. "gruppi".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
           01 cose pic x(10) value "Stuff".
           01 alfabeto pic AAA value "abc".
           01 numeri pic 9(4) value 1234.
           01 numeriNeg pic S9(4) value -1234.
           01 percentuale pic 9(4)V99 value zeros.
           01 Cliente.
               02 matricola pic 9(3).
               02 nome pic x(20).
               02 nascita.
                   03 mese pic 99.
                   03 giorno pic 99.
                   03 anno pic 9(4).
           01 num1 pic 9 value 5.
           01 num2 pic 9 value 4.
           01 num3 pic 9 value 3.
           01 risposta pic S99V99 value 0.
           01 Rem pic 9V999.
       procedure division.
       1000-start-here.
       move "Altre Cose" TO cose.
       move "123" to cose.
       move 123 to cose.
       display cose.
       display percentuale.
       move "123Ale Marok           02062006" to Cliente.
       display nome
       display mese "/" giorno "/" anno
      *sopra ho contato 20 spazi da Ale in poi perchè è la lunghezza 
      *delle lettere che ho dichiarato sopra
       move zero to cose
       display cose
       move space to cose
       display cose
       move high-value to cose
       display cose
       move low-value to cose
       display cose
       move quote to cose
       display cose
       move all "2" to cose
       display cose
       add num1 to num2 giving risposta
       display risposta
       subtract num1 from num2 giving risposta
       display risposta
       multiply num1 by num2 giving risposta
       display risposta
       divide num1 into num2 giving risposta
       display risposta
       divide num1 into num2 giving risposta remainder Rem
       display "Remainder: " Rem
       add num1, num2 to num3 giving risposta
       display risposta


       stop run.
       end program gruppi.
       