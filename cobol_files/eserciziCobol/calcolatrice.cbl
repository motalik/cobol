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
           display "Inserisci operazione (+, -, "
           "*, /): "
           accept operator.
           display "Inserisci numero 2: "
           accept num2.
       
           perform calcola-riultato
               display "Il risultato è: ", result.
       
           stop run.
       
       calcola-riultato.
           evaluate operator
               when "+"
                   compute result = num1 + num2
               when "-"
                   compute result = num1 - num2
               when "*"
                   compute result = num1 * num2
               when "/"
                   if num2 not = 0
                       compute result = num1 / num2
                   else
                       display "Errore: Divisione per zero non "
                       "consentita"
                   end-if
               when other
                   display "Operazione non riconosciuta"
                   stop run
           end-evaluate.
       
       