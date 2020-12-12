
dim f as integer
dim file_name as string
dim lineIn as string
dim codeCommand as string
dim shared loadArray(1000) as zstring * 255
dim shared loadArray2(1000) as zstring * 255
dim counter1 as integer = 1
dim counter2 as integer = 1
dim counter3 as integer = 0
dim counter4 as integer = 0
dim accumulator as integer = 0
dim dummy as zstring * 255
dim failCode as integer = 0
dim failCounter as integer = 0
dim failTries as integer = 0

f = freefile

file_name = "F:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/advent08/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

do
    line input #f, lineIn 'everything
    loadArray(counter1) = lineIn
    counter1 = counter1 + 1
loop until EOF (f)

close #f

home:

for counter4 = 1 to counter1
    loadArray2(counter4) = loadArray(counter4)
next counter4

do
    if loadArray2(counter2) = dummy then
        print "Infinite Loop"
        failCode = 1
        exit do
    end if
    codeCommand = trim(mid(loadArray2(counter2), 1, instr(loadArray2(counter2), " ")))
    counter3 = valint(mid(loadArray2(counter2), instr(loadArray2(counter2), " "), len(loadArray2(counter2)) - instr(loadArray2(counter2), " ") + 1))
    loadArray2(counter2) = dummy
    if codeCommand = "jmp" then
        if failTries = failCounter then
            codeCommand = "nop"
        end if
        failTries = failTries + 1
    end if
    if codeCommand = "nop" then
        counter2 = counter2 + 1
    elseif codeCommand = "acc" then
        accumulator = accumulator + counter3
        counter2 = counter2 + 1
    else 'jmp
        counter2 = counter2 + counter3
    end if
    print "Accumulator: "; accumulator
    print "Next line: "; counter2
    if counter2 > counter1 then
        print "overshoot"
        failCode = 2
        exit do
    end if
    print
loop until counter2 = counter1

if failCounter > 650 then
    goto nope
end if

if failCode = 1 or failCode = 2 then
    failCounter = failCounter + 1
    failTries = 0
    failCode = 0
    counter2 = 1
    accumulator = 0
    Goto home
else
    print "Victory"
end if

for counter2 = 1 to counter1
    print loadArray2(counter2)
next counter2

print "Final accumulator: "; accumulator
end

nope:
print "nope"

