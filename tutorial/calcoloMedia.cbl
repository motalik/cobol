       IDENTIFICATION DIVISION.
       PROGRAM-ID. CalcolaMedia.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NumeroInserito PIC 9(3) value 1.
       01 Totale PIC 9(6).
       01 Contatore PIC 9(3).
       01 Media PIC 999V999.

       PROCEDURE DIVISION.
           MOVE 0 TO Totale
           MOVE 0 TO Contatore
           DISPLAY "Inserisci una serie di numeri (0 per calcolare la" 
            "media)."
    
           PERFORM UNTIL NumeroInserito = 0
               DISPLAY "Inserisci un numero: "
               ACCEPT NumeroInserito
               IF NumeroInserito NOT EQUAL 0
                   ADD NumeroInserito TO Totale
                   ADD 1 TO Contatore
               END-IF
           END-PERFORM
    
           IF Contatore = 0
               DISPLAY "Nessun numero inserito."
           ELSE
               COMPUTE Media = Totale / Contatore
               DISPLAY "La media dei numeri inseriti è: " Media
           END-IF
    
           STOP RUN.

