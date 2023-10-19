       identification division.
       program-id. "cobol".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
       01 altezza pic 999.
       01 peso pic 999.
           01 bmi pic 999V99.
       procedure division.
       1000-start-here.
           display "Inserisci la tua altezza in cm: ".
           accept altezza.
           display "Inserisci il tuo peso: ".
           accept peso.
           compute bmi = (peso/(altezza*altezza))*10000.
           display "Il tuo BMI: ", bmi, " %".
       stop run.
       end program cobol.
       
