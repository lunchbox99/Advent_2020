
dim f as integer
dim file_name as string
dim lineIn as string
dim shared counter1 as integer = 1
dim shared loadArray(1001) as ulongint
dim counter2 as integer = 0
dim startScan as integer = 1
dim present as integer = 26

f = freefile

file_name = "F:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/advent09/input.txt"

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

function checkCode(start as integer, present as ulongint) as integer
    dim num1 as ulongint = start
    dim num2 as ulongint = 0
    dim result as integer = 0
    do
        for num2 = (num1 + 1) to (start + 24)
            if loadArray(num1) + loadArray(num2) = present then
                result = 0
                exit do
            end if
        next num2
        num1 = num1 + 1
        if num1 = start + 25 then
            result = 1
            exit do
        end if
    loop
    return result
end function

function findSum(inNum as ulongint) as ulongint
    dim arrPointer as integer = 1
    dim arrOffset as integer = 2
    dim arrCounter as integer = 0
    dim arrTotal as ulongint = 0
    dim switch as integer = 0
    dim tempLong as ulongint = 0

    for arrPointer = 1 to counter1
        do
            arrTotal = 0
            for arrCounter = arrPointer to arrOffset
                arrTotal = arrTotal + loadArray(arrCounter)
            next arrCounter
            if arrTotal = inNum then
                print
                do 'a bubble sort, cause why not
                    switch = 0
                    for arrCounter = arrPointer to (arrOffset - 1)
                        if loadArray(arrCounter) > loadArray(arrCounter + 1)  then
                            switch = 1
                            tempLong = loadArray(arrCounter + 1)
                            loadArray(arrCounter + 1) = loadArray(arrCounter)
                            loadArray(arrCounter) = tempLong
                        end if
                    next arrCounter
                loop until switch = 0

                for arrCounter = arrPointer to (arrOffset)
                        print loadArray(arrCounter)
                next arrCounter

                print
                print loadArray(arrPointer)
                print loadArray(arrOffset)
                print
                return loadArray(arrPointer) + loadArray(arrOffset)
            end if
            if arrTotal > inNum then
                arrOffset = arrPointer + 2
                exit do
            end if
            arrOffset = arrOffset + 1
        loop
    next arrPointer

end function

for counter2 = 1 to (counter1 - 1)
      if checkCode(counter2, loadArray(counter2 + 25)) = 1 then
        print "Part 1: "; loadArray(counter2 + 25)
        print "FindSum: "; findSum(loadArray(counter2 + 25))

        end
      end if
next counter2
