'7_1
'Step 1. Find every bag color with roots to gold bag. Count and eliminate from list.
'Step 2. Find every bag color with roots to step1. Count and eliminate from list.
'Step 3. Repeat until no chages are made.

dim f as integer
dim file_name as string
dim lineIn as string
dim tempString as string
dim tempString2 as string
dim foundTarget as integer = 0
dim countBags as integer = 0
dim lastBag as integer = 0
dim prevBag as integer = 0
dim shared loadArray(600) as zstring * 255
dim counter1 as integer = 1
dim counter2 as integer = 0
dim counter3 as integer = 0
dim shared total as integer = 0

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

function recurse(target as string) as integer
    dim counter3 as integer = 0
    dim tempString2 as string
    dim foundTarget as integer  = 0
    

    for counter3 = 1 to 595
        foundTarget = instr(loadArray(counter3), target)
        if foundTarget > 1 then 
            tempString2 = trim(mid(loadArray(counter3), 1, instr(loadArray(counter3), "contain") - 2))    
            print "tempstring2: "; tempString2   
            loadArray(counter3) = ""
            total = total + 1
            recurse(tempString2)
        end if 
    next counter3
    return total

end function

for counter2 = 1 to (counter1 - 1)
    foundTarget = instr(loadArray(counter2), "shiny gold")
    if foundTarget > 1 then 
        tempString = trim(mid(loadArray(counter2), 1, instr(loadArray(counter2), "contain") - 2))    
        print "tempString: " ;tempString   
        loadArray(counter2) = ""
        
        do
        total = 0 
        loop until recurse(tempString) = 0
    end if 
   
next counter2   





