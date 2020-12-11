'7_1
'Step 1. Find every bag color with roots to gold bag. Add to list.
'Step 2. Find next item on list.
'Step 3. Find every bag color with roots to next item on list, no duplicates.
'Step 4. Repeat until end of list.

dim f as integer
dim file_name as string
dim lineIn as string
dim tempString as string
dim foundTarget as integer = 0
dim shared loadArray(600) as zstring * 255
dim shared theList(1000) as zstring * 100
dim counter1 as integer = 1
dim listCounter as integer = 1
dim listCounter2 as integer = 1
dim counter2 as integer = 0
dim counter3 as integer = 0
dim startSearch as integer = 0
dim endSearch as integer = 0
dim totalBags as integer = 0

f = freefile

file_name = "F:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/advent07/input.txt"

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


function stripExta(beforeS as string) as string
    return trim(ltrim(beforeS, ANY "0123456789"))
end function

function getInteger(inString as string) as integer
    return valint(inString)
end function

theList(1) = "1 shiny gold bags contain"

do
for counter2 = 1 to (counter1 - 1)
    foundTarget = instr(loadArray(counter2), stripExta(theList(listCounter)))
    if foundTarget > 0 then
        startSearch = instr(loadArray(counter2), "contain") + 8
        endSearch = instr(loadArray(counter2), ",")
        if endSearch = 0 then
            endSearch = instr(loadArray(counter2), ".")
        end if
        tempString = mid(loadArray(counter2), startSearch, endSearch - startSearch)
        if instr(tempString, "bags") then
            tempString = tempString + " contain"
        else
            tempString = tempString + "s contain"
        end if
        if tempString <> "no other bags contain" then
            theList(listCounter2 +1) = str(getInteger(tempString) * getInteger(theList(listCounter))) + " " + stripExta(tempString)
            listCounter2 = listCounter2 + 1
        end if
        do
            startSearch = endSearch + 2
            endSearch = instr(startSearch + 1, loadArray(counter2), ",")
            if endSearch = 0 then
                endSearch = instr(startSearch + 1, loadArray(counter2), ".")
                if endSearch = 0 then
                    exit do
                end if
            end if
            tempString = mid(loadArray(counter2), startSearch, endSearch - startSearch)
            if instr(tempString, "bags") then
                tempString = tempString + " contain"
            else
                tempString = tempString + "s contain"
            end if
            if tempString <> "no other bags contain" then
                theList(listCounter2 +1) = str(getInteger(tempString) * getInteger(theList(listCounter))) + " " + stripExta(tempString)
                listCounter2 = listCounter2 + 1
            end if
        loop
    end if
next counter2
listCounter = listCounter + 1
loop until trim(theList(listCounter)) = ""

for counter3 = 1 to (counter1 + 1)
    totalBags = totalBags  + getInteger(theList(counter3))
    print theList(counter3)
next counter3

print "Total: "; totalBags - 1
