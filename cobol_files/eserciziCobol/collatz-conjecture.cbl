       IDENTIFICATION DIVISION.
       PROGRAM-ID. collatz-conjecture.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 num PIC 9(8).
       01 cont PIC 9(4).

       PROCEDURE DIVISION.
       COLLATZ-CONJECTURE.
       display "Inserisci il numero da cui partire: "
       accept num.
       if num <= 0
          display "Devi Mettere un numero positivo!"
       end-if
       perform varying cont FROM 0 by 1 until num <= 1
          IF FUNCTION MOD(num,2) = 0 THEN 
      *MOD is giving the remainder of num / 2
            COMPUTE num = num / 2
          ELSE
            COMPUTE num = (num * 3) + 1
          END-IF 
       end-perform

       DISPLAY cont.
       end program collatz-conjecture.
*
