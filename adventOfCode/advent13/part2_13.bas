
dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim counter2 as integer = 0
dim counter3 as integer = 0
dim counter4 as integer = 0
dim counter5 as integer = 0
dim loadArray(3) as string
dim valFirst as integer = 0
dim valNext as integer = 0
dim multInt as integer = 0
dim increment as integer = 1
dim countUp as integer = 1
dim test as integer = 0

f = freefile

file_name = "F:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/Advent13/test.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

do
    line input #f, lineIn 'everything
    loadArray(counter1) = lineIn
    counter1 = counter1 + 1
loop until EOF (f)

counter1 = counter1 - 1

close #f

'print valint(loadArray(1))


do
    counter3 = instr(counter2 + 1, loadArray(2), ",")
    counter4 = valint(mid(loadArray(2), counter2 + 1,  counter3 - counter2))
    if counter4 <> 0 then
        'print counter4 - (valint(loadArray(1)) mod counter4); " ";
        'print counter4
        valNext = counter4
        If valFirst <> 0 then
            do
                multInt = multInt + increment
            if counter5 = 7 then
                if (multInt * valNext) mod valFirst = counter5 then
                    test = 1
                end if
            else
                if (multInt - counter5) mod valNext = 0 Then
                    test = 1
                end if
            end if
            print "increment: "; increment; " "; " MultiInt: "; multInt; " Mod: "; (multInt - counter5) mod valNext
            print " valFirst: "; valFirst; " "; " valNext: "; valNext;" Counter5: "; counter5

            loop until test = 1
            test = 0
            increment = (valFirst * valNext)
            valFirst = valNext
            multInt = (multInt * valNext) - counter5
        end if
        if counter5 = 0 then valFirst = valNext
        counter5 = counter5 + 1
        'if counter5 > 1 then exit do
    else
        counter5 = counter5 + 1
        'print "Counter5: "; counter5
    end if


    counter2 = counter3
loop until counter2 = 0

            print "increment: "; increment; " "; " MultiInt: "; multInt; " Mod: "; (multInt * valNext) mod valFirst
            print " valFirst: "; valFirst; " "; " valNext: "; valNext;" Counter5: "; counter5


print valFirst
