       identification division.
       PROGRAM-ID. "write-to-file".
       date-written. sabato.
       environment division.
       input-output section.
       file-control.
           select CustomerReport assign to "CustReport.dat"
           organization is line sequential.
           select CustomerFile assign to "Customer.dat"
               organization is line sequential.

       data division.
       file section.
       fd CustomerReport.
           01 PrintLine pic x(44).
               
       FD CustomerFile.
           01 CustomerData.
               02 IDNum pic 9(5).
               02 CustName.
                   03 FirstName pic x(15).
                   03 LastName pic x(15).
               88 WSEOF value high-value.
      *file description
       working-storage section.
           01 PageHeading.
               02 filler pic x(13) value "Customer List".
           01 PageFooting.
               02 Filler pic x(15) value space.
               02 filler pic x(7) value "Page : ".
               02 PrnPageNum pic Z9.
           01 Heads pic x(36) value "IDNum     FirstName     LastName".
           01 CustomerDetailLine.
               02 filler pic x value space.
               02 PrnCustID pic 9(5).
               02 filler pic x(4) value space.
               02 PrnFirstName pic X(15).
               02 filler pic xx value space.
               02 PrnLastName pic X(15).
           01 ReportFooting pic x(13) value "End of report".
           01 LineCOunt pic 99 value zero.
               88 NewPageRequired value 40 thru 99.
           01 PageCount pic 99 value zero.
       procedure division.
       1000-start-here.
           open input CustomerFile.
           open output CustomerReport
               perform PrintPageHeading
                   read CustomerFile
                       at end set WSEOF to true
                   end-read
               perform PrintReportBody until WSEOF
                   write PrintLine from ReportFooting after advancing 5
                   lines
           close CustomerFile, CustomerReport.
           stop run.
           printPageHeading.
           write PrintLine from PageHeading after advancing Page
           write PrintLine from Heads after advancing 5 lines
           move 3 to LineCOunt
           add 1 to PageCount.
           
           PrintReportBOdy.
           if NewPageRequired
               move PageCOunt to PrnPageNum
               write PrintLine from PageFooting after advancing 5 lines
               perform printPageHeading
           end-if
           move IDNum to PrnCustID
           move FirstName to PrnFirstName
           move LastName to PrnLastName
           write PrintLine from CustomerDetailLine after advancing
           1 line
           add 1 to LineCOunt
           read CustomerFile
               at end set WSEOF to true
           end-read.
          
       end program write-to-file.
       