       IDENTIFICATION DIVISION. 
       PROGRAM-ID. "prova".
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 nome PIC x(20).
           01 cognome pic x(20).
           01 anni pic 99.
           01 luogoNAscita.
               05 provincia pic x(20).
               05 regione pic x(20).
           01 capelli pic x(20).
           01 occhi pic x(20).
           01 caratteristiche pic x(100).
           01 professione pic x(100).
       PROCEDURE DIVISION.
           1000-START-PARA.
           DISPLAY "Nome: " WITH NO ADVANCING.
           ACCEPT nome.
           DISPLAY "Cognome: " with no advancing.
           accept cognome.
           DISPLAY "Anni: " with no advancing.
           accept anni.
           display "Luogo di nascita(PR, REG): " with no advancing.
           accept luogoNascita.
           display "Colore capelli: " with no advancing.
           accept capelli.
           display "Colore occhi: " with no advancing.
           accept occhi.
           display "Caratteristiche: " with no advancing.
           accept caratteristiche.
           display "Professione: " with no advancing.
           accept professione.
           DISPLAY "Nome: " nome.
           DISPLAY "Cognome: " cognome.
           display "Anni: " anni.
           display "Luogo nascita(PR, REG): " provincia.
           display "Colore capelli: " capelli.
           display "Colore occhi: " occhi.
           display "Caratteristiche: " caratteristiche.
           display "Professione: " professione.
       STOP RUN.