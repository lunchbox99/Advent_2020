const maxRow as integer = 93
const maxCol as integer = 97
dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim loadArray(maxRow) as string
dim counter2 as integer = 1
dim counter3 as integer = 1
dim shared arr1(maxCol,maxRow) as zstring * 2
dim arr2(maxCol,maxRow) as zstring * 2
dim emptyCheck as integer = 0
dim fullCheck as integer = 0
dim lcount as integer = 0
dim change as integer = 0
dim bigLoop as integer = 0

f = freefile

file_name = "C:/Programming/FreeBASIC/projects/advent11/input.txt"

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

for counter2 = 1 to counter1
    for counter3 = 1 to maxCol
        arr1(counter3, counter2) = mid(loadArray(counter2), counter3, 1)
    next counter3
next counter2


for counter2 = 1 to counter1
    for counter3 = 1 to maxCol
        arr2(counter3, counter2) = arr1(counter3, counter2)
    next counter3
next counter2

function spotCheck (row as string, col as string, inVal as string, xCounter as integer, yCounter as integer) as integer
    dim returnCheck as integer = 0
    dim internalCountx as integer = 0
    dim internalCounty as integer = 0
    dim notVal as string = "#"

    if inVal = "#" then notVal = "L"

    '+ right, down. - left, up, * no movement.
    if row = "+" then
    ' col stays the same
        if col = "*" then
            if xCounter < maxCol then
                internalCountx = xCounter + 1
                do
                    if trim(arr1(internalCountx, yCounter)) = notVal then
                        exit do
                    end if
                    if trim(arr1(internalCountx, yCounter)) = inVal then
                        returnCheck = 1
                    end if
                    internalCountx = internalCountx + 1
                loop until internalCountx > maxCol
            end if
        end if
    'col decreasing
        if col = "-" then
            if (xCounter < maxCol) and (yCounter > 1) then
                internalCountx = xCounter + 1
                internalCounty = yCounter - 1
                do
                    if trim(arr1(internalCountx, internalCounty)) = notVal then
                        exit do
                    end if
                    if trim(arr1(internalCountx, internalCounty)) = inVal then
                        returnCheck = 1
                    end if
                    internalCountx = internalCountx + 1
                    internalCounty = internalCounty - 1
                loop until (internalCountx > maxCol) or (internalCounty < 1)
            end if       
        end if
    'col increasing
        if col = "+" then
            if (xCounter < maxCol) and (yCounter < maxRow) then
                internalCountx = xCounter + 1
                internalCounty = yCounter + 1
                do
                    if trim(arr1(internalCountx, internalCounty)) = notVal then
                        exit do
                    end if
                    if trim(arr1(internalCountx, internalCounty)) = inVal then
                        returnCheck = 1
                    end if
                    internalCountx = internalCountx + 1
                    internalCounty = internalCounty + 1
                loop until ((internalCountx > maxCol) or (internalCounty > maxRow))
            end if       
        end if
    end if
    if row = "-" then
    ' col stays the same
        if col = "*" then
            if xCounter > 1 then
                internalCountx = xCounter - 1
                do
                    if trim(arr1(internalCountx, yCounter)) = notVal then
                        exit do
                    end if
                    if trim(arr1(internalCountx, yCounter)) = inVal then
                        returnCheck = 1
                    end if
                    internalCountx = internalCountx - 1
                loop until internalCountx < 1
            end if
        end if
    'col decreasing
        if col = "-" then
            if (xCounter > 1) and (yCounter > 1) then
                internalCountx = xCounter - 1
                internalCounty = yCounter - 1
                do
                    if trim(arr1(internalCountx, internalCounty)) = notVal then
                        exit do
                    end if
                    if trim(arr1(internalCountx, internalCounty)) = inVal then
                        returnCheck = 1
                    end if
                    internalCountx = internalCountx - 1
                    internalCounty = internalCounty - 1
                loop until (internalCountx < 1) or (internalCounty = 0)
            end if       
        end if
    'col increasing
        if col = "+" then
            if (xCounter > 1) and (yCounter < maxRow) then
                internalCountx = xCounter - 1
                internalCounty = yCounter + 1
                do
                    if trim(arr1(internalCountx, internalCounty)) = notVal then
                        exit do
                    end if
                    if trim(arr1(internalCountx, internalCounty)) = inVal then
                        returnCheck = 1
                    end if
                    internalCountx = internalCountx - 1
                    internalCounty = internalCounty + 1
                loop until ((internalCountx < 1) or (internalCounty > maxRow))
            end if     
        end if
    end if
    if row = "*" then
    ' col stays the same
        if col = "*" then
            if trim(arr1(xCounter, yCounter)) = inVal then
                returnCheck = 1
            end if
        end if
    'col decreasing
        if col = "-" then
            if yCounter  > 1 then
                internalCounty = yCounter - 1
                do
                    if trim(arr1(xCounter, internalCounty)) = notVal then
                        exit do
                    end if
                    if trim(arr1(xCounter, internalCounty)) = inVal then
                        returnCheck = 1
                    end if
                    internalCounty = internalCounty - 1
                loop until internalCounty < 1
            end if     
        end if
    'col increasing
        if col = "+" then
            if yCounter < maxCol then
                internalCounty = yCounter + 1
                do
                    if trim(arr1(xCounter, internalCounty)) = notVal then
                        exit do
                    end if
                    if trim(arr1(xCounter, internalCounty)) = inVal then
                        returnCheck = 1
                    end if
                    internalCounty = internalCounty + 1
                loop until internalCounty > maxRow
            end if     
        end if
    end if
    return returnCheck
end function

do

for counter2 = 1 to counter1
    for counter3 = 1 to maxCol
        emptyCheck = emptyCheck + spotCheck("*","*","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("*","*",".",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("+","*","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("-","*","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("+","+","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("+","-","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("-","-","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("-","+","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("*","-","#",counter3, counter2)
        emptyCheck = emptyCheck + spotCheck("*","+","#",counter3, counter2)
        if emptyCheck = 0 then
            arr2(counter3, counter2) = "#"
        end if
        emptyCheck = 0
    next counter3
next counter2

for counter2 = 1 to counter1
    for counter3 = 1 to maxCol
        if trim(arr1(counter3, counter2)) = "#" then
            fullCheck = fullCheck + spotCheck("+","*","#",counter3, counter2)
            fullCheck = fullCheck + spotCheck("-","*","#",counter3, counter2)
            fullCheck = fullCheck + spotCheck("*","+","#",counter3, counter2)
            fullCheck = fullCheck + spotCheck("*","-","#",counter3, counter2)
            fullCheck = fullCheck + spotCheck("-","-","#",counter3, counter2)
            fullCheck = fullCheck + spotCheck("+","+","#",counter3, counter2)
            fullCheck = fullCheck + spotCheck("+","-","#",counter3, counter2)
            fullCheck = fullCheck + spotCheck("-","+","#",counter3, counter2)
            if fullCheck > 4 then
                arr2(counter3, counter2) = "L"
            end if
            fullCheck = 0
        end if
    next counter3
next counter2

change = 0

for counter2 = 1 to counter1
    for counter3 = 1 to maxCol
        if arr1(counter3, counter2) <> arr2(counter3, counter2) then
            change = change + 1
        end if
        arr1(counter3, counter2) = arr2(counter3, counter2)
    next counter3
next counter2
bigLoop = bigLoop + 1
 print change
loop until change = 0

for counter2 = 1 to counter1
    for counter3 = 1 to maxCol
        if trim(arr2(counter3, counter2)) = "#" then
            lcount = lcount + 1
        end if
    next counter3
next counter2

for counter2 = 1 to counter1
    for counter3 = 1 to maxCol
        print trim(arr2(counter3, counter2));
    next counter3
    print
next counter2

print lcount
