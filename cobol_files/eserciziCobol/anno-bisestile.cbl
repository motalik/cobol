       identification division.
       program-id. "anno-bisestile".
       date-written. "domenica".
       environment division.
       data division.
       working-storage section.
       01 anno pic 9(4).
       01 Rem pic 9(4).
       procedure division.
       1000-start-here.
           display "Inserisci l'anno: " with no advancing
           accept anno
           divide anno by 4 giving anno remainder Rem
           if Rem equal to 0 then
               display "Anno Bisestile!"
           else
               display "Anno non bisestile!"
           end-if
           stop run.

***********************

