
dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
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
                print loadArray(num1)
                print loadArray(num2)
                print
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

for counter2 = 1 to (counter1 - 1)
      if checkCode(counter2, loadArray(counter2 + 25)) = 1 then
        print loadArray(counter2 + 25)
        end
      end if
next counter2
