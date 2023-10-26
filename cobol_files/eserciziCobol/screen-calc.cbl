       identification division.
       program-id. "screen-calc".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
       01 WS-NUM1 PIC 9(4).
       01 WS-OPERATORE PIC X.
       01 WS-NUM2 PIC 9(4).
       01 WS-RISULTATO PIC 9(7).9(4).
       SCREEN SECTION.
       01 CLEAR-SCREEN.
       05 BLANK SCREEN.
       01 INPUT-SCREEN.
           02 LINE 6 COLUMN 24 VALUE IS 'NUM 1: '.
           02 COLUMN 30 PIC 9(4) USING WS-NUM1.
           02 LINE 7 COLUMN 20 VALUE IS 'OPERATORE: '.
           02 COLUMN 30 PIC X USING WS-OPERATORE.
           02 LINE 8 COLUMN 24 VALUE IS 'NUM 2: '.
           02 COLUMN 30 PIC 9(4) USING WS-NUM2.
       procedure division.
       1000-start-here.
       DISPLAY CLEAR-SCREEN
       DISPLAY INPUT-SCREEN
       ACCEPT INPUT-SCREEN
       IF WS-OPERATORE = '+' THEN
           COMPUTE WS-RISULTATO = WS-NUM1 + WS-NUM2
           DISPLAY WS-RISULTATO
       ELSE IF WS-OPERATORE = '-' THEN
           COMPUTE WS-RISULTATO = WS-NUM1 - WS-NUM2
           DISPLAY WS-RISULTATO
       ELSE IF WS-OPERATORE = '*' THEN
           COMPUTE WS-RISULTATO = WS-NUM1 * WS-NUM2
           DISPLAY WS-RISULTATO
       ELSE IF WS-OPERATORE = '/' THEN
           COMPUTE WS-RISULTATO = WS-NUM1 / WS-NUM2
           DISPLAY WS-RISULTATO
       ELSE
           DISPLAY "NON CONOSCO L'OPERATORE!"
       END-IF.
       stop run.
       end program screen-calc.
*
