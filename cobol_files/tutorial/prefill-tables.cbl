       identification division.
       program-id. "prefill-tables".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
       01 ProdTable.
           02 ProdData.
               03 filler pic x(9) value "Rosa SML".
               03 filler pic x(9) value "Blu  SML".
               03 filler pic x(9) value "RossaSML".
           02 filler redefines ProdData.
               03 Shirt occurs 3 times.
                   04 ProdName pic x(4).
                   04 ProdSizes pic A occurs 3 times.
       01 ChangeMe.
           02 TextNum pic x(6).
           02 FloatNum redefines TextNum pic 9(4)V99.
       01 StrNum pic x(6).
       01 SplitNum.
           02 WNum pic 9(4) value zero.
           02 FNum pic 99 value zero.
       01 FlNum redefines SplitNum pic 9999V99.
       01 DollarNum pic $$,$$9.99.    
       procedure division.
       1000-start-here.
           display Shirt(1).
           move '123456' to TextNum.
           display FloatNum.
           display "Inserisci un numero decimale: " with no ADVANCING.
           accept StrNum
           unstring StrNum
               delimited by "." or all spaces
               into Wnum, Fnum.
           move FlNum to DollarNum
           display DollarNum.
       stop run.
       end program prefill-tables.
****************

       