       IDENTIFICATION DIVISION.
       PROGRAM-ID. TabellaMoltiplicazione.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 num PIC 9(3).
           01 Indice PIC 9(3) VALUE 1.
           01 Risultato PIC 9(4).
       
       PROCEDURE DIVISION.
           DISPLAY "Inserisci il numero da moltiplicare: ".
           ACCEPT num.
           DISPLAY "Tabella di moltiplicazione del ", num.
           PERFORM until Indice > 10
               perform CalcolaTabella
               PERFORM VisualizzaTabella
               add 1 to Indice
           end-perform
           STOP RUN.
       
       CalcolaTabella.
           compute Risultato = num * Indice.
           
       VisualizzaTabella.
           DISPLAY "    ", Indice, " x ", num, " = ", Risultato.
