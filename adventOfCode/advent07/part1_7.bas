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
dim repeatBag as integer = 0
dim shared loadArray(600) as zstring * 255
dim shared theList(1000) as zstring * 100
dim counter1 as integer = 1
dim listCounter as integer = 1
dim listCounter2 as integer = 1
dim counter2 as integer = 0
dim counter3 as integer = 0

f = freefile

file_name = "c:/Programming/FreeBASIC/projects/advent07/input.txt"

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

theList(1) = "shiny gold bags"

do
for counter2 = 1 to (counter1 - 1)
    foundTarget = instr(loadArray(counter2), theList(listCounter))
    if foundTarget > 1 then 
        tempString = trim(mid(loadArray(counter2), 1, instr(loadArray(counter2), "contain") - 3))
        for counter3 = 1 to (listCounter2 + 1)
            if tempString = theList(counter3) then
                repeatBag = 1
            end if
        next counter3
        if repeatBag = 0 then
            listCounter2 = listCounter2 + 1
            theList(listCounter2) = tempString
        end if
        repeatBag = 0
    end if
next counter2 
listCounter = listCounter + 1 
loop until trim(theList(listCounter)) = ""

for counter3 = 1 to (listCounter + 1)    
    print theList(counter3)
next counter3



