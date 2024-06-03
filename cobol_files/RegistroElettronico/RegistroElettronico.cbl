       IDENTIFICATION DIVISION.
       PROGRAM-ID. RegistroElettronico.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *Creazione file
           SELECT FileOut ASSIGN TO 'registro.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FileOut.
       01  FileOut-Record  PIC X(80).
       
       WORKING-STORAGE SECTION.
      *Dichiarazione variabili
       01  Cognome PIC X(50).
       01  riga1  PIC X(80).
       01  riga2 PIC X(80).
       01  riga5 PIC X(80).
       01  riga3 PIC X(80).
       01  riga4 PIC X(80).
       01  materia PIC X(80).
       01  voto PIC 99V99 VALUE 0.
       01  voto-for PIC Z9.99.
       01  tipo PIC X(1).
       01  totale PIC 9(5)V99 VALUE 0.
       01  totale1 PIC 9(5)V99 VALUE 0.
       01  media1 PIC 99V9.
       01  media1-for PIC Z9.99.
       01  media PIC 99V9.
       01  media-for PIC Z9.99.
       01  cont PIC 99 VALUE 0.
       01  cont1 PIC 99 VALUE 0.
       
       PROCEDURE DIVISION.
      *Apertura file
       OPEN OUTPUT FileOut
      *Esecuzione paragarfo NOME
       PERFORM NOME
      *Inserimento di una stringa e della variabile Cognome nella riga1
      *e riga2 del file
       STRING "Studente " DELIMITED BY SIZE
               Cognome DELIMITED BY SIZE
               INTO riga1
       STRING "    Materie primo periodo:" DELIMITED BY SIZE
           INTO riga2
       MOVE riga1 TO FileOut-Record  
       WRITE FileOut-Record
       MOVE riga2 TO FileOut-Record  
       WRITE FileOut-Record
      *Esecuzione paragarfo MATERIE-PRIMOPERIODO
       PERFORM MATERIE-PRIMOPERIODO
       STRING "    Materie secondo periodo:" DELIMITED BY SIZE
           INTO riga5
       MOVE riga5 TO FileOut-Record
       WRITE FileOut-Record
      *Esecuzione paragarfo MATERIE-SECONDOPERIODO
       PERFORM MATERIE-SECONDOPERIODO
       PERFORM MEDIA-FINALE
      *Chiusura file
       CLOSE FileOut
      *Chiusura programma
       STOP RUN.

      *Paragrafo NOME      
       NOME.
       DISPLAY "Inserisci cognome dello studente: "
       ACCEPT Cognome.
      *Paragrafo MATERIE-PRIMOPERIODO
       MATERIE-PRIMOPERIODO.
       DISPLAY "Primo periodo"
      *Inizio ciclo while
       PERFORM UNTIL materia = "stop"
           DISPLAY "Inserisci Materia: "
           ACCEPT materia
           IF materia NOT EQUAL TO "stop"
               MOVE SPACES TO riga3
               STRING "        " DELIMITED BY SIZE
                   materia DELIMITED BY SIZE
                   INTO riga3
               MOVE riga3 TO FileOut-Record
               WRITE FileOut-Record
      *Reset di queste variabili
               MOVE 0 TO totale
               MOVE 0 TO cont
               MOVE 0 TO voto
      *Altro ciclo while
               PERFORM UNTIL voto = 11
                   DISPLAY "Inserisci voto(11 per terminare) "
                   ACCEPT voto
      *Controllo per continuare o no il programma
                   IF voto NOT EQUAL TO 11
                       COMPUTE totale = totale + voto
                       ADD 1 TO cont
                       COMPUTE totale1 = totale1 + voto
                       ADD 1 TO cont1
                       DISPLAY "Orale = o, Scritto = s, Pratico = p"
                       ACCEPT tipo
                       MOVE SPACES TO riga3
      *Inserimento del voto nel file
                       MOVE voto TO voto-for
                       STRING "           " DELIMITED BY SIZE
                           voto-for DELIMITED BY SIZE
                           " " DELIMITED BY SIZE
                           tipo DELIMITED BY SIZE
                           INTO riga3
                       MOVE riga3 TO FileOut-Record
                       WRITE FileOut-Record
                   END-IF
               END-PERFORM 
      *fine del ciclo
               IF cont > 0
                   COMPUTE media = totale / cont
                   IF media < 6
                       DISPLAY "La media di questa materia è "
                       "insufficiente."
      *Richiesta del voto di recupero
                       DISPLAY "Inserisci il voto di recupero: "
                       ACCEPT voto
                       IF voto < 6
                           MOVE media TO media-for
                           STRING "            Media " DELIMITED BY SIZE
                           media-for DELIMITED BY SIZE
                           " Non recuperata"
                           INTO riga4
                       ELSE
                           MOVE voto TO voto-for
                           MOVE media TO media-for
                           STRING "            Media " DELIMITED BY SIZE
                           media-for DELIMITED BY SIZE
                           " Recuperata con "
                           voto-for
                           INTO riga4
                       END-IF
                   ELSE
      *Inserimento voto
                       MOVE media TO media-for
                       STRING "            Media " DELIMITED BY SIZE
                           media-for DELIMITED BY SIZE
                           INTO riga4
                   END-IF
                   MOVE riga4 TO FileOut-Record
                   WRITE FileOut-Record
                   MOVE SPACES TO riga4
               END-IF
           END-IF
      *fine paragrafo(con il .) e del loop
       END-PERFORM.
   
      *Inizio secondo paragrafo(uguale all'altro) 
       MATERIE-SECONDOPERIODO.
          DISPLAY "Secondo periodo"
          MOVE 0 TO materia
          PERFORM UNTIL materia = "stop"
              DISPLAY "Inserisci Materia: "
              ACCEPT materia
              IF materia NOT EQUAL TO "stop"
                  MOVE SPACES TO riga3
                  STRING "        " DELIMITED BY SIZE
                      materia DELIMITED BY SIZE
                      INTO riga3
                  MOVE riga3 TO FileOut-Record
                  WRITE FileOut-Record
                  MOVE 0 TO totale
                  MOVE 0 TO cont
                  MOVE 0 TO voto
                  PERFORM UNTIL voto = 11
                      DISPLAY "Inserisci voto(11 per terminare) "
                      ACCEPT voto
                      IF voto NOT EQUAL TO 11
                          COMPUTE totale = totale + voto
                          COMPUTE totale1 = totale1 + voto
                          COMPUTE cont = cont + 1
                          ADD 1 TO cont1
                          DISPLAY "Orale = o, Scritto = s, Pratico = p"
                          ACCEPT tipo
                          MOVE SPACES TO riga3
                          MOVE voto TO voto-for
                          STRING "           " DELIMITED BY SIZE
                              voto-for DELIMITED BY SIZE
                              " " DELIMITED BY SIZE
                              tipo DELIMITED BY SIZE
                              INTO riga3
                          MOVE riga3 TO FileOut-Record
                          WRITE FileOut-Record
                      END-IF
                  END-PERFORM
               IF cont > 0
                   COMPUTE media = totale / cont
                   IF media < 6
                       DISPLAY "La media di questa materia è "
                       "insufficiente."
                       DISPLAY "Inserisci il voto di recupero: "
                       ACCEPT voto
                       IF voto < 6
                           MOVE media TO media-for
                           STRING "            Media " DELIMITED BY SIZE
                           media-for DELIMITED BY SIZE
                           " Non recuperata(bocciato)"
                           INTO riga4
                        ELSE
                           MOVE voto TO voto-for
                           MOVE media TO media-for
                           STRING "            Media " DELIMITED BY SIZE
                           media-for DELIMITED BY SIZE
                           " Recuperata con "
                           voto-for
                           INTO riga4
                        END-IF

                   ELSE
                       MOVE media TO media-for
                       STRING "            Media " DELIMITED BY SIZE
                           media-for DELIMITED BY SIZE
                           INTO riga4
                   END-IF
                   MOVE riga4 TO FileOut-Record
                   WRITE FileOut-Record
                   MOVE SPACES TO riga4
               END-IF
           END-IF
      *fine secondo paragrafo
       END-PERFORM.

      *paragrafo per calcolo media finale
       MEDIA-FINALE.
           COMPUTE media1 = totale1 / cont1
           move media1 to media1-for
           STRING "Media totale: " DELIMITED BY SIZE
               media1-for DELIMITED BY SIZE
               INTO riga4
           MOVE riga4 TO FileOut-Record
           WRITE FileOut-Record.
