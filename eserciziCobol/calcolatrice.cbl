       identification division.
       program-id. "CALCOLATRICE".
       date-written. "Sabato".
       
       environment division.
       data division.
       working-storage section.
       01 num1 pic 999.
       01 num2 pic 999.
       01 result pic 9999999.
       01 operator pic x(20).
       
       procedure division.
           display "Inserisci numero 1: "
           accept num1.
           display "Inserisci numero 2: "
           accept num2.
           display "Inserisci operazione (somma, sottrazione, "
           "moltiplicazione, divisione): "
           accept operator.
       
           perform calcola-riultato
               display "Il risultato è: ", result.
       
           stop run.
       
       calcola-riultato.
           evaluate operator
               when "somma"
                   compute result = num1 + num2
               when "sottrazione"
                   compute result = num1 - num2
               when "moltiplicazione"
                   compute result = num1 * num2
               when "divisione"
                   if num2 not = 0
                       compute result = num1 / num2
                   else
                       display "Errore: Divisione per zero non "
                       "consentita"
                   end-if
               when other
                   display "Operazione non riconosciuta"
           end-evaluate.
       
       