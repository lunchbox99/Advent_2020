dim f as integer
dim file_name as string
dim valOne as string
dim valTwo as string

dim counter1 as integer = 1
dim counter2 as integer = 0
dim fromRight as integer = 0
dim lineNo as integer = 1

f = freefile

file_name = "c:/programming/FreeBASIC/projects/advent03/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

'function validate(upperB as integer, lowerB as integer, needle as string, hay as string) as integer
    
'end function

    input #f, valOne

do until EOF (f)
    input #f, valOne 'everything
    lineNo = lineNo + 1
    counter1 = counter1 + 3
    fromRight = counter1 mod len(valOne)
    if fromRight = 0 then fromRight = 31
    if (mid(valOne, fromRight, 1) = "#") Then
        counter2 = counter2 + 1
        print lineNo; " ";fromRight
    end if
    
loop

close #f

print counter2
print lineNo
print fromRight