       identification division.
       program-id. "merge-file".
       date-written. "sabato".
       environment division.
       input-output section.
       file-control.
           select WorkFile assign to 'work.dat'.
           select File1 assign to 'student.dat'
               organization is line sequential.
           select File2 assign to 'student3.dat'
               organization is line sequential.
           select NewFile assign to 'student4.dat'
               organization is line sequential.
       data division.
       file section.
       fd File1.
       01 StudData.
           02 IDNum pic 9.
           02 StudName pic x(10).
       fd File2.
       01 StudData2.
           02 IDNum2 pic 9.
           02 StudName2 pic x(10).

       sd WorkFile.
       01 WStudData.
           02 WIDNum pic 9.
           02 WStudName pic x(10).

       fd NewFile.
       01 NStudData.
           02 NIDNum pic 9.
           02 NStudName pic x(10).
    
       procedure division.
       1000-start-here.
           merge WorkFile on ascending key NIDNum
               using File1, File2
               giving NewFile
       stop run.
       end program merge-file. 
