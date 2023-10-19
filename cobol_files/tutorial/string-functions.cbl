       identification division.
       program-id. "string-functions".
       date-written. sabato.
       environment division.
       data division.
       working-storage section.
           01 Str pic x(20) value "abcde fghi lnoperew".
           01 NumChars pic 99 value 0.
           01 NumEs pic 99 value 0.
           01 Fname pic x(10) value "Alessandro".
           01 Mname pic x(7) value "Motalik".
           01 Lname pic x(7) value "Marocco".
           01 FullName pic x(20).
           01 FullMname pic x(30).
       procedure division.
       1000-start-here.
           inspect Str tallying NumChars for characters.
           display "Caratteri: " NumChars.
           inspect Str tallying NumEs for all 'e'.
           display "Numero di E: " NumEs.
           display function upper-case(Str)
           display function lower-case(str)

           string Fname delimited by size
           space
           Lname delimited by size
           into FullName.
           display FullName.

           string FullName delimited by spaces
           space
           Mname delimited by size
           space
           Lname delimited by size
           into FullMName
           on overflow display 'Overflowed'
           display FullMname.
       stop run.
       end program string-functions.
       