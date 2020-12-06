dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 0
dim counter2 as integer = 0
dim counter3 as integer = 0
dim counter4 as integer = 0
dim firstLine as integer = 1
dim alphabet1(26) as integer
dim alphabet2(26) as integer
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
        print
        for counter2 = 1 to 26
            if alphabet1(counter2) = 1 then
                counter3 = counter3 + 1
                print "counter3: "; counter3
            end if
        next counter2
        for counter2 = 1 to 26
            alphabet1(counter2) = 0
        next counter2
        counter4 = counter4 + counter3
        counter3 = 0
        firstLine = 1
   else
        counter1 = len(lineIn)
        if firstLine = 1 then
            for counter2 = 1 to counter1
                ascCode = asc(mid(lineIn, counter2, 1))
                alphabet1(ascCode - 96) = 1
            next counter2
            firstLine = 0
            print "first"
        else
            print "next"
            for counter2 = 1 to counter1
                ascCode = asc(mid(lineIn, counter2, 1))
                alphabet2(ascCode - 96) = 1
            next counter2
            for counter2 = 1 to 26
                if alphabet1(counter2) = 1 and alphabet2(counter2) = 1 then
                    alphabet1(counter2) = 1
                else
                    alphabet1(counter2) = 0
                end if
            next counter2
            print "alpha2: ";
            for counter2 = 1 to 26
                print alphabet2(counter2);
            next counter2
            print
            print "alpha1: ";
            for counter2 = 1 to 26
                print alphabet1(counter2);
            next counter2
            print
            for counter2 = 1 to 26
                alphabet2(counter2) = 0
            next counter2
        end if
   end if
loop

'flush
print
for counter2 = 1 to 26
    if alphabet1(counter2) = 1 then
        counter3 = counter3 + 1
        print "counter3: "; counter3
    end if
next counter2
for counter2 = 1 to 26
    alphabet1(counter2) = 0
next counter2
counter4 = counter4 + counter3
counter3 = 0
firstLine = 1

close #f

print counter4
