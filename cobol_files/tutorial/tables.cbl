       identification division.
       program-id. "tables".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
       01 Table1.
           02 Friend pic x(15) occurs 4 times.
       01 CustTable.
           02 CustName occurs 5 times.
               03 FName pic x(15).
               03 LName pic x(15).
       01 OrderTable.
           02 Product occurs 2 times indexed by I.
               03 ProdName pic x(13).
               03 Prodsize occurs 3 times indexed by J.
                   04 SizeType pic A.
       procedure division.
       1000-start-here.
       set I J to 1.
       move 'Maglia Rosa ' to Product(I).
       move 'S' to Prodsize(I, J).
       set J up by 1.
       move 'M' to Prodsize(I, J).
       set J down by 1.
       move 'Maglia Rosa  SMLFelpa Grigia SML' to OrderTable.
       perform GetProduct varying I from 1 by 1 until I>2.
           go to LookUp.

       GetProduct.
           display product(I).
           perform GetSizes varying J from 1 by 1 until J>3.

       GetSizes.
           display ProdSize(I, J).

       LookUp.
           set I to 1.
           search Product
               at end display 'Prodotto non trovato'
               when ProdName(I)= 'Maglia Rosa'
                   display 'Maglia Rosa trovata!'
           end-search.
       stop run.
       end program tables.
*****************

