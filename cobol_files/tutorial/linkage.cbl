       identification division.
       program-id. "linkage".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
           01 num1 pic 99.
           01 num2 pic 99.
           01 sum1 pic 999.
       procedure division.
       1000-start-here.
           call 'linkage-get-sum' using num1, num2, sum1.
           display num1 " + " num2 " = " sum1.
      *quando compili devi fare cobc -m <nome_file_esterno>
       stop run.
       end program linkage.
       