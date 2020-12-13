
dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim loadArray(93) as string
dim counter2 as integer = 1
dim counter3 as integer = 1
dim arr1(97,93) as zstring * 2
dim arr2(97,93) as zstring * 2
dim emptyCheck as integer = 0
dim fullCheck as integer = 0
dim lcount as integer = 0
dim change as integer = 0

f = freefile

file_name = "F:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/advent11/input.txt"

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
    for counter3 = 1 to 97
        arr1(counter3, counter2) = mid(loadArray(counter2), counter3, 1)
    next counter3
next counter2


for counter2 = 1 to counter1
    for counter3 = 1 to 97
        arr2(counter3, counter2) = arr1(counter3, counter2)
    next counter3
next counter2

do

for counter2 = 1 to counter1
    for counter3 = 1 to 97
        if trim(arr1(counter3, counter2)) <> "L" then
            emptyCheck = 1
        end if
        if counter2 > 1 then
            if trim(arr1(counter3, counter2 - 1)) = "#" then
                emptyCheck = 2
            end if
            if counter3 > 1 then
                if trim(arr1(counter3 - 1, counter2 - 1)) = "#" then
                    emptyCheck = 3
                end if
            end if
        end if
        if counter3 > 1 then
            if trim(arr1(counter3 - 1, counter2)) = "#" then
                emptyCheck = 4
            end if
            if counter2 < 93 then
                if trim(arr1(counter3 - 1, counter2 + 1)) = "#" then
                    emptyCheck = 5
                end if
            end if
        end if
        if counter3 < 97 then
            if trim(arr1(counter3 + 1, counter2)) = "#" then
                emptyCheck = 6
            end if
            if counter2 < 93 then
                if trim(arr1(counter3 + 1, counter2 + 1)) = "#" then
                    emptyCheck = 7
                end if
            end if
            if counter2 > 1 then
                if trim(arr1(counter3 + 1, counter2 - 1)) = "#" then
                    emptyCheck = 8
                end if
            end if
        end if
        if counter2 < 93 then
            if trim(arr1(counter3, counter2 + 1)) = "#" then
                emptyCheck = 9
            end if
        end if
        if emptyCheck = 0 then
            arr2(counter3, counter2) = "#"
        else
           ' arr2(counter3, counter2) = "."
        end if
        emptyCheck = 0
    next counter3
next counter2

for counter2 = 1 to counter1
    for counter3 = 1 to 97
        if trim(arr1(counter3, counter2)) = "#" then
            if counter2 > 1 then
                if trim(arr1(counter3, counter2 - 1)) = "#" then
                    fullCheck = fullCheck + 1
                end if
                if counter3 > 1 then
                    if trim(arr1(counter3 - 1, counter2 - 1)) = "#" then
                        fullCheck = fullCheck + 1
                    end if
                end if
            end if
            if counter3 > 1 then
                if trim(arr1(counter3 - 1, counter2)) = "#" then
                    fullCheck = fullCheck + 1
                end if
                if counter2 < 93 then
                    if trim(arr1(counter3 - 1, counter2 + 1)) = "#" then
                        fullCheck = fullCheck + 1
                    end if
                end if
            end if
            if counter3 < 97 then
                if trim(arr1(counter3 + 1, counter2)) = "#" then
                    fullCheck = fullCheck + 1
                end if
                if counter2 < 93 then
                    if trim(arr1(counter3 + 1, counter2 + 1)) = "#" then
                        fullCheck = fullCheck + 1
                    end if
                end if
                if counter2 > 1 then
                    if trim(arr1(counter3 + 1, counter2 - 1)) = "#" then
                        fullCheck = fullCheck + 1
                    end if
                end if
            end if
            if counter2 < 93 then
                if trim(arr1(counter3, counter2 + 1)) = "#" then
                    fullCheck = fullCheck + 1
                end if
            end if
            if fullCheck > 3 then
                arr2(counter3, counter2) = "L"
            end if
            fullCheck = 0
        end if
    next counter3
next counter2

change = 0

for counter2 = 1 to counter1
    for counter3 = 1 to 97
        if arr1(counter3, counter2) <> arr2(counter3, counter2) then
            change = change + 1
        end if
        arr1(counter3, counter2) = arr2(counter3, counter2)
    next counter3
next counter2
loop until change = 0

for counter2 = 1 to counter1
    for counter3 = 1 to 97
        if trim(arr2(counter3, counter2)) = "#" then
            lcount = lcount + 1
        end if
    next counter3
next counter2

for counter2 = 1 to counter1
    for counter3 = 1 to 97
        print trim(arr2(counter3, counter2));
    next counter3
    print
next counter2

print lcount
