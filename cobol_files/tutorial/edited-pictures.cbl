       identification division.
       program-id. "edited-pictures".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
           01 StartNum pic 9(8)V99 value 00001123.55.
           01 NoZero pic ZZZZZZZ9.99.
           01 NoZeroPlusCommas pic ZZ,ZZZ,ZZ9.99.
           01 Dollar pic $$,$$$,$$9.99.
           01 Bday pic 9(8) value 02062006.
           01 Adate pic 99/99/9999.
       procedure division.
       1000-start-here.
           move StartNum to NoZero
           display NoZero.
           move StartNum to NoZeroPlusCommas
           display NoZeroPlusCommas.
           move StartNum to Dollar
           display Dollar.
           move Bday to Adate
       stop run.
       end program edited-pictures.
       