
dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim counter2 as integer = 0
dim counter3 as integer = 0
dim counter4 as integer = 0
dim loadArray(3) as string

f = freefile

file_name = "C:/Programming/FreeBASIC/projects/Advent13/input.txt"

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

print valint(loadArray(1))


do
    counter3 = instr(counter2 + 1, loadArray(2), ",")
    counter4 = valint(mid(loadArray(2), counter2 + 1,  counter3 - counter2))
    if counter4 <> 0 then
        print counter4 - (valint(loadArray(1)) mod counter4); " ";
    end if
    counter2 = counter3
loop until counter2 = 0
