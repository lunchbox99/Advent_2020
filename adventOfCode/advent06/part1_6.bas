dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 0
dim counter2 as integer = 0
dim counter3 as integer = 0
dim counter4 as integer = 0
dim alphabet(26) as integer
dim ascCode as integer
f = freefile

file_name = "c:/Programming/FreeBASIC/projects/advent06/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

do until EOF (f)
   input #f, lineIn 'everything

    'lineIn = "aaazzz"

   if trim(lineIn) = "" then
        'process
        for counter2 = 1 to 26
            if alphabet(counter2) = 1 then
                counter3 = counter3 + 1
                'print "counter3: "; counter3
            end if
        next counter2
        for counter2 = 1 to 26
            alphabet(counter2) = 0
        next counter2
        counter4 = counter4 + counter3
        counter3 = 0
   else
        counter1 = len(lineIn)
        for counter2 = 1 to counter1
            ascCode = asc(mid(lineIn, counter2, 1))
            alphabet(ascCode - 96) = 1
        next counter2

   end if
loop

'flush
for counter2 = 1 to 26
    if alphabet(counter2) = 1 then
        counter3 = counter3 + 1
        'print "counter3: "; counter3
    end if
next counter2
for counter2 = 1 to 26
    alphabet(counter2) = 0
next counter2
    counter4 = counter4 + counter3
    counter3 = 0

close #f

print counter4
