dim f as integer
dim file_name as string
dim valOne as string
dim valTwo as string

dim counter1 as integer = 1
dim counter2 as integer = 0
dim counter3 as integer = 0
dim counter4 as integer = 0
dim counter5 as integer = 0
dim counter6 as integer = 0
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
    counter1 = counter1 + 3
    fromRight = counter1 mod len(valOne)
    if fromRight = 0 then fromRight = 31
    if (mid(valOne, fromRight, 1) = "#") Then
        counter2 = counter2 + 1
    end if
    
loop

close #f

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If
    input #f, valOne
counter1 = 1
do until EOF (f)
    input #f, valOne 'everything
    counter1 = counter1 + 1
    fromRight = counter1 mod len(valOne)
    if fromRight = 0 then fromRight = 31
    if (mid(valOne, fromRight, 1) = "#") Then
        counter3 = counter3 + 1
    end if
    
loop

close #f

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If
    input #f, valOne
counter1 = 1
do until EOF (f)
    input #f, valOne 'everything
    counter1 = counter1 + 5
    fromRight = counter1 mod len(valOne)
    if fromRight = 0 then fromRight = 31
    if (mid(valOne, fromRight, 1) = "#") Then
        counter4 = counter4 + 1
    end if
    
loop

close #f

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If
    input #f, valOne
counter1 = 1
do until EOF (f)
    input #f, valOne 'everything
    counter1 = counter1 + 7
    fromRight = counter1 mod len(valOne)
    if fromRight = 0 then fromRight = 31
    if (mid(valOne, fromRight, 1) = "#") Then
        counter5 = counter5 + 1
    end if
    
loop

close #f

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If
    input #f, valOne
    input #f, valOne
    lineNo = lineNo + 1
counter1 = 1
do until EOF (f)
    lineNo = lineNo + 1
    input #f, valOne 'everything
    counter1 = counter1 + 1
    fromRight = counter1 mod len(valOne)
    if fromRight = 0 then fromRight = 31
    if (mid(valOne, fromRight, 1) = "#") Then
        counter6 = counter6 + 1
    end if
    input #f, valOne 'everything
    lineNo = lineNo + 1
loop

close #f

print counter2 * counter3 * counter4 * counter5 * counter6
