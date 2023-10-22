       IDENTIFICATION DIVISION.
       PROGRAM-ID. radice-quadrata.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N pic 9(9).
       01 result pic 999V999.
       PROCEDURE DIVISION.
       display "Inserisci un numero: "
       accept N
       compute result rounded = N ** 0.5
       display result.

       stop run.
       end program radice-quadrata.
*
