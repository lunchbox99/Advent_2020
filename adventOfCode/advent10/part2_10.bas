
dim f as integer
dim file_name as string
dim lineIn as string
dim shared counter1 as integer = 1
dim shared loadArray(1001) as ulongint
dim switch as integer = 0
dim tempInt as integer = 0
dim arrCounter as integer = 0
dim startCount as integer = 0
dim endCount as ulongint = 1

f = freefile

file_name = "F:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/advent10/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

do
    line input #f, lineIn 'everything
    loadArray(counter1) = valulng(lineIn)
    counter1 = counter1 + 1
loop until EOF (f)


close #f

do
    switch = 0
    for arrCounter = 1 to (counter1 - 1)
        if loadArray(arrCounter) > loadArray(arrCounter + 1)  then
            switch = 1
            tempInt = loadArray(arrCounter + 1)
            loadArray(arrCounter + 1) = loadArray(arrCounter)
            loadArray(arrCounter) = tempInt
        end if
    next arrCounter
loop until switch = 0

loadArray(counter1 + 1) = loadArray(counter1) + 3
counter1 = counter1 + 1
tempInt = 0

for arrCounter = 1 to (counter1)
    print loadArray(arrCounter)
next arrCounter

print

for arrCounter = 2 to (counter1)
    if loadArray(arrCounter) = loadArray(arrCounter -1) + 1 then
        startCount = startCount + 1
    else
        startCount = startCount + 1
        if startCount = 5 then endCount = endCount * 7
        if startCount = 4 then endCount = endCount * 4
        if startCount = 3 then endCount = endCount * 2
        startCount = 0
    end if
next arrCounter

print endCount
