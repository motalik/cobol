       identification division.
       program-id. "data-classification".
       date-written. sabato.
       environment division.
       configuration section.
       special-names.
           class PassingScore IS "A" thru "C", "D".
       data division.
       working-storage section.
           01 Eta pic 99 value 0.
           01 scuola pic 99 value 0.
           01 punteggio pic x(1) value "B".
           01 SezionePuoVotare pic 9 value 0.
               88 PuoVotare value 1.
               88 NonPuoVotare value 0.
           01 NumeroTest pic X.
               88 Primo value "1", "3", "5", "7".
               88 Dispari value "1", "3", "5", "7", "9".
               88 Pari value "2", "4", "6", "8".
               88 MinoreDi5 value "1" thru "5".
               88 EUnNumero value "0" thru "9". 
       procedure division.
       1000-start-here.
           display "Inserisci la tua età: " with no advancing
           accept Eta
           if Eta >= 18 then
               display "Puoi votare!"
           else
               display "Non puoi votare!"
           end-if
           if Eta less than 5 then
               display "Stai a casa!"
           end-if
           if Eta = 5 then
               display "Vai all'elementari"
           end-if
           if Eta > 5 and Eta < 18 then
               compute scuola = Eta - 5
               display "Vai alla scuola ", scuola
           end-if
           if Eta greater than or equal to 18
               display "Vai all'università!"
           end-if

           if punteggio is PassingScore  then
               display "Sei promosso!"
           else
               display "Sei bocciato!"
           end-if
           if punteggio is not numeric then
               display "Non un numero!"
           end-if
           
       stop run.
       end program data-classification.
       