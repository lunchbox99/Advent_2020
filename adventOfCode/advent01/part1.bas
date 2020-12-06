dim f as integer
dim file_name as string
dim valOne as integer
dim values(1000) as integer
dim counter as integer
dim startVal as integer
dim endVal as integer

f = freefile

file_name = "c:/programming/FreeBASIC/projects/advent01/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

counter = 1

do until EOF (f)
    input #f, valOne
    values(counter) = valOne
    counter = counter + 1
loop

close #f

startVal = 1
endVal = counter
counter = 2

do until values(startVal) + values(counter) = 2020
    if counter = endVal Then
        startVal = startVal +1
        counter = startVal + 1
    end if
    counter = counter + 1
loop

print values(startVal)
print values(counter)
print values(startVal) * values(counter)
