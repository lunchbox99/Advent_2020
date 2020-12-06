dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim rowNum as integer = 0
dim colNum as integer = 0
dim idNum as integer = 0
dim lastId as integer = 0
dim winString as string = ""
dim winRow as integer = 0
dim winCol as integer = 0

f = freefile

file_name = "f:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/advent05/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If




do until EOF (f)
   input #f, lineIn 'everything
    'lineIn = "BBFFBBFRLL"
    if mid(lineIn, 1, 1) = "F" then
        rowNum = 63
    else
        rowNum = 127
    end if
    if mid(lineIn, 2, 1) = "F" then
        rowNum = rowNum - 32
    end if
    if mid(lineIn, 3, 1) = "F" then
        rowNum = rowNum - 16
    end if
    if mid(lineIn, 4, 1) = "F" then
        rowNum = rowNum - 8
    end if
    if mid(lineIn, 5, 1) = "F" then
        rowNum = rowNum - 4
    end if
    if mid(lineIn, 6, 1) = "F" then
        rowNum = rowNum - 2
    end if
    if mid(lineIn, 7, 1) = "F" then
        rowNum = rowNum - 1
    end if
    if mid(lineIn, 8, 1) = "L" then
        colNum = 3
    else
        colNum = 7
    end if
    if mid(lineIn, 9, 1) = "L" then
        colNum = colNum - 2
    end if
    if mid(lineIn, 10, 1) = "L" then
        colNum = colNum - 1
    end if

    idNum = rowNum * 8 + colNum

    if idNum > lastId then
        lastId = idNum
        winString = lineIn
        winRow = rowNum
        winCol = colNum
    end if

loop

close #f

print "seat ID: "; lastId
print "String: "; winString
print "Row: "; winRow
print "Column: "; winCol
