dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim rowNum as integer = 0
dim colNum as integer = 0
dim idNum as integer = 0
dim lastId as integer = 0
dim firstId as integer = 200
dim winString as string = ""
dim lowString as string = ""
dim highRow as integer = 0
dim highCol as integer = 0
dim lowRow as integer = 0
dim lowCol as integer = 0
dim allSeats(1000) as integer

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

    allSeats(idNum) = 1

    if idNum > lastId then
        lastId = idNum
        winString = lineIn
        highRow = rowNum
        highCol = colNum
    end if

    if idNum < firstId then
        firstId = idNum
        lowString = lineIn
        lowRow = rowNum
        lowCol = colNum
    end if

loop

close #f

print "highseat ID: "; lastId
print "highString: "; winString
print "highRow: "; highRow
print "highColumn: "; highCol

print "lowseat ID: "; firstId
print "lowString: "; lowString
print "lowRow: "; lowRow
print "lowColumn: "; lowCol

for counter1 = firstId to lastId
    if allSeats(counter1) <> 1 then
        print "Missing number: "; counter1
    end if
next counter1
