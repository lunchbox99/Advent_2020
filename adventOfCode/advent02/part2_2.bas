dim f as integer
dim file_name as string
dim valOne as string
dim valTwo as string
dim valThree as string
dim valFour as string
dim valFive as string
dim valSix as string
dim counter1 as integer = 0
dim counter2 as integer = 0
dim posOne as integer
dim posTwo as integer
dim valUpper as integer
dim valLower as integer

f = freefile

file_name = "c:/programming/FreeBASIC/projects/advent02/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

function validate(upperB as integer, lowerB as integer, needle as string, hay as string) as integer
    dim lastPos as integer
    dim uhit as integer = 0
    dim lhit as integer = 0
        
    lastPos = instr(hay, needle)
    if lastPos = lowerB Then
        lhit = 1
    end if
    if lastPos = upperB Then
        uhit = 1
    end if

    do while lastPos <> 0
        lastPos = instr(lastPos + 1, hay, needle)
        if lastPos = lowerB Then
            lhit = 1
        end if
        if lastPos = upperB Then
            uhit = 1
        end if
    loop
    
    if uhit + lhit = 1 then
        return 1
    else
        return 0
    end if

end function

do until EOF (f)
    input #f, valOne 'everythinbg
    posOne = instr(valOne, ":")
    valTwo = mid(valOne,1, posOne - 3)
    valThree = mid(valOne, posOne-1, 1) 'key letter
    valFour = mid(valOne, posOne + 2) 'data field
    posTwo = instr(valTwo, "-")
    valFive = mid(valTwo, 1, posTwo - 1)
    valSix = mid(valTwo, posTwo + 1)
    valLower = valint(valFive)
    valUpper = valint(valSix)
    counter1 = validate(valUpper, valLower, valThree, valFour)
    if counter1 = 1 Then
        counter2 = counter2 + 1
    end if
loop

close #f

print counter2