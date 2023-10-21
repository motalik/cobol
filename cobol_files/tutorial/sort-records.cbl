       identification division.
       program-id. "prova".
       date-written. "sabato".
       environment division.
       input-output section.
       file-control.
           select WorkFile assign to 'work.tmp'.
           select OrgFile assign to 'student.dat'
               organization is line sequential.
           select SortedFile assign to 'student2.dat'
               organization is line sequential.
       data division.
       file section.
       fd OrgFile.
       01 StudData.
           02 IDNum pic 9.
           02 StudName pic x(10).

       sd WorkFile.
       01 WStudData.
           02 WIDNum pic 9.
           02 WStudName pic x(10).

       fd SortedFile.
       01 SStudData.
           02 SIDNum pic 9.
           02 SStudName pic x(10).
    
       procedure division.
       1000-start-here.
           sort WorkFile on ascending key SIDNum
               using OrgFile
               giving SortedFile
           stop run.

