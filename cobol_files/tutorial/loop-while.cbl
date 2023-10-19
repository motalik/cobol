       identification division.
       program-id. "loop-while".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
           01 Ind pic 9 value 0.
       procedure division.
           perform OutputData with test after until Ind > 5
               go to ForLoop.
       OutPutData.
           display Ind.
           add 1 to Ind.
       ForLoop.
           perform OutputData2 varying Ind from 1 by 1 until Ind=5
           stop run.
       OutputData2.
           display Ind.
       stop run.
       end program loop-while.
       